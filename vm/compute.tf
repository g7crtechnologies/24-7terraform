locals {
  rg_id     = data.terraform_remote_state.es.outputs.rg_id
  subnet_id = data.terraform_remote_state.es.outputs.subnet_id
  rg_name   = data.terraform_remote_state.es.outputs.rg_name
  location  = "Central India"
  prefix    = "tfs"
}

module "cloud_init" {
  source        = "./cloud_init"
  template_file = "file(${path.module}/templates/init.tpl)"
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files

resource "azurerm_network_interface" "main" {
  for_each            = var.host_info
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
  for_each            = var.host_info
  name                = local.info.vm_name
  resource_group_name = local.rg_name
  location            = local.location
  size                = local.info.vm_size
  admin_username      = local.info.vm_admin
  admin_password      = local.info.vm_pass
  custom_data         = module.cloud_init.config

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]
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
