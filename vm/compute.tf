locals {
  rg_id     = data.terraform_remote_state.es.outputs.rg_id
  subnet_id = data.terraform_remote_state.es.outputs.subnet_id
  rg_name   = data.terraform_remote_state.es.outputs.rg_name
  location  = "Central India"
  prefix    = "tfs"
  info      = module.host_info.info
}

module "cloud_init" {
  source        = "./cloud_init"
  template_file = "file(${path.module}/templates/init.tpl)"
}

module "host_info" {
  source = "./host_info"
}

data "azurerm_resource_group" "rg" {
  name = "tfvmex-resources"
}
data "azurerm_storage_account" "storeacc" {
  resource_group_name = data.azurerm_resource_group.rg.name
  name                = "tfsstorageacc"
}

# RSA key of size 4096 bits
data "azurerm_ssh_public_key" "ssh_key" {
  resource_group_name = data.azurerm_resource_group.rg.name
  name                = "tfs_ssh"
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files

resource "azurerm_availability_set" "aset" {
  count                        = local.info.enable_vm_availability_set == true ? 1 : 0
  name                         = lower("avail-${local.info.vm_name}-${data.azurerm_resource_group.rg.location}")
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  platform_fault_domain_count  = local.info.platform_fault_domain_count
  platform_update_domain_count = local.info.platform_update_domain_count
  proximity_placement_group_id = local.info.enable_proximity_placement_group == true ? azurerm_proximity_placement_group.appgrp.0.id : null
  managed                      = true
  tags                         = merge({ "ResourceName" = lower("avail-${local.info.vm_name}-${data.azurerm_resource_group.rg.location}") }, local.info.tags, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
resource "azurerm_proximity_placement_group" "appgrp" {
  count               = local.info.enable_proximity_placement_group == true ? 1 : 0
  name                = lower("proxigrp-${local.info.vm_name}-${data.azurerm_resource_group.rg.location}")
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = merge({ "ResourceName" = lower("proxigrp-${local.info.vm_name}-${data.azurerm_resource_group.rg.location}") }, local.info.tags, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_managed_disk" "new_data_disk" {
  count                = length(local.info.data_disk_name)
  name                 = local.info.data_disk_name[count.index]
  location             = local.location
  resource_group_name  = local.rg_name
  storage_account_type = local.info.data_disk_storage_acc_type
  create_option        = "Empty"
  disk_size_gb         = local.info.disk_size_gb
  tags                 = local.info.tags
}

resource "azurerm_network_interface" "main" {
  name                = "${local.prefix}-${local.info.nic_name}-nic"
  location            = local.location
  resource_group_name = local.rg_name
  ip_configuration {
    name                          = local.info.ip_name
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = local.info.private_ip_address_alloc
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                         = local.info.vm_name
  resource_group_name          = local.rg_name
  location                     = local.location
  size                         = local.info.vm_size
  custom_data                  = module.cloud_init.config
  provision_vm_agent           = true
  allow_extension_operations   = true
  availability_set_id          = local.info.enable_vm_availability_set == true ? element(concat(azurerm_availability_set.aset.*.id, [""]), 0) : null
  encryption_at_host_enabled   = local.info.enable_encryption_at_host
  proximity_placement_group_id = local.info.enable_proximity_placement_group == true ? azurerm_proximity_placement_group.appgrp.0.id : null
  zone                         = local.info.enable_vm_availability_set == true ? null : local.info.vm_availability_zone
  tags                         = local.info.tags

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  dynamic "admin_ssh_key" {
    for_each = local.info.disable_password_authentication == true ? [1] : []
    content {
      username   = local.info.admin_username
      public_key = data.azurerm_ssh_public_key.ssh_key.public_key
    }
  }

  dynamic "boot_diagnostics" {
    for_each = local.info.enable_boot_diagnostics == true ? [1] : []
    content {
      storage_account_uri = local.info.storage_account_name == null ? local.info.storage_account_uri : "${data.azurerm_storage_account.storeacc.primary_blob_host}/compute"
    }
  }


  disable_password_authentication = false
  os_disk {
    caching              = local.info.disk_caching
    storage_account_type = local.info.disk_strg_acc_type
  }

  source_image_reference {
    publisher = local.info.publisher
    offer     = local.info.offer
    sku       = local.info.sku
    version   = local.info.version
  }
}

data "azurerm_private_dns_zone" "infra" {
  name                = local.info.pvt_dns_zone_name
  resource_group_name = local.info.pvt_rg_name
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm" {
  count              = length(local.info.data_disk_name)
  managed_disk_id    = azurerm_managed_disk.new_data_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.test.id
  lun                = local.info.data_disk_lun + "${count.index + 1}"
  caching            = local.info.caching_type
  depends_on = [
    azurerm_managed_disk.new_data_disk, azurerm_linux_virtual_machine.test
  ]
}

resource "azurerm_private_dns_a_record" "arecord1" {
  name                = local.info.vm_name
  zone_name           = data.azurerm_private_dns_zone.infra.name
  resource_group_name = local.info.pvt_rg_name
  ttl                 = 300
  records             = [azurerm_linux_virtual_machine.test.private_ip_address]
}
