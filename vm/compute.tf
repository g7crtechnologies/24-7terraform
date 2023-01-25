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


# Render a multi-part cloud-init config making use of the part
# above, and other source files

resource "azurerm_availability_set" "aset" {
  count                        = var.enable_vm_availability_set ? 1 : 0
  name                         = lower("avail-${var.virtual_machine_name}-${data.azurerm_resource_group.rg.location}")
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = data.azurerm_resource_group.rg.location
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  proximity_placement_group_id = var.enable_proximity_placement_group ? azurerm_proximity_placement_group.appgrp.0.id : null
  managed                      = true
  tags                         = merge({ "ResourceName" = lower("avail-${var.virtual_machine_name}-${data.azurerm_resource_group.rg.location}") }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
resource "azurerm_proximity_placement_group" "appgrp" {
  count               = var.enable_proximity_placement_group ? 1 : 0
  name                = lower("proxigrp-${var.virtual_machine_name}-${data.azurerm_resource_group.rg.location}")
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = merge({ "ResourceName" = lower("proxigrp-${var.virtual_machine_name}-${data.azurerm_resource_group.rg.location}") }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_managed_disk" "new_data_disk" {
  count                 = length(var.data_disk_name)
  name                  = var.data_disk_name[count.index]
  location              = var.resource_group_location
  resource_group_name   = local.resource_group_name
  storage_account_type  = var.data_disk_storage_acc_type
  network_access_policy = "AllowPrivate"
  create_option         = "Empty"
  disk_size_gb          = var.disk_size_gb
  disk_access_id        = azurerm_disk_access.diskaccess.id
  tags                  = var.tags
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
  admin_username               = local.info.vm_admin
  admin_password               = local.info.vm_pass
  custom_data                  = module.cloud_init.config
  provision_vm_agent           = true
  allow_extension_operations   = true
  availability_set_id          = var.enable_vm_availability_set == true ? element(concat(azurerm_availability_set.aset.*.id, [""]), 0) : null
  encryption_at_host_enabled   = var.enable_encryption_at_host
  proximity_placement_group_id = var.enable_proximity_placement_group ? azurerm_proximity_placement_group.appgrp.0.id : null
  zone                         = var.vm_availability_zone
  tags                         = merge({ "ResourceName" = var.instances_count == 1 ? var.virtual_machine_name : format("%s%s", lower(replace(var.virtual_machine_name, "/[[:^alnum:]]/", "")), count.index + 1) }, var.tags, )

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  dynamic "admin_ssh_key" {
    for_each = var.disable_password_authentication ? [1] : []
    content {
      username   = var.admin_username
      public_key = var.admin_ssh_key_data == null ? tls_private_key.rsa[0].public_key_openssh : file(var.admin_ssh_key_data)
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []
    content {
      storage_account_uri = var.storage_account_name != null ? data.azurerm_storage_account.storeacc.0.primary_blob_endpoint : var.storage_account_uri
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
  name                = var.pvt_dns_zone_name
  resource_group_name = var.pvt_rg_name
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm" {
  count              = length(var.data_disk_name)
  managed_disk_id    = azurerm_managed_disk.new_data_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm.id
  lun                = var.data_disk_lun + "${count.index + 1}"
  caching            = var.caching_type
}

resource "azurerm_private_dns_a_record" "arecord1" {
  count               = local.info.name
  name                = var.redis_instance_name
  zone_name           = data.azurerm_private_dns_zone.infra.name
  resource_group_name = var.pvt_rg_name
  ttl                 = 300
  records             = [azurerm_linux_virtual_machine.test.private_ip_address]
}
