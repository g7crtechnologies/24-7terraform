output "info" {
  description = "a whole bag of data passed back to tfs_compute module..."
  value = {
    # instance_config = local.default_instance_config.I
    # II = local.default_instance_config.II
    nic_name                 = local.default_instance_config.nic_name
    ip_name                  = local.default_instance_config.ip_name
    private_ip_address_alloc = local.default_instance_config.private_ip_address_alloc
    vm_name                  = local.default_instance_config.vm_name
    vm_size                  = local.default_instance_config.vm_size
    vm_admin                 = local.default_instance_config.vm_admin
    vm_pass                  = local.default_instance_config.vm_pass
    disk_caching             = local.default_instance_config.disk_caching
    disk_strg_acc_type       = local.default_instance_config.disk_strg_acc_type
    publisher                = local.default_instance_config.publisher
    offer                    = local.default_instance_config.offer
    sku                      = local.default_instance_config.sku
    version                  = local.default_instance_config.version
  }
}
