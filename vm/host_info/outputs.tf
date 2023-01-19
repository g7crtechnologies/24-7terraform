output "info" {
  description = "a whole bag of data passed back to tfs_compute module..."
  value = {
    # instance_config = local.I
    # II = local.II
    nic_name                 = local.nic_name
    ip_name                  = local.ip_name
    private_ip_address_alloc = local.private_ip_address_alloc
    vm_name                  = local.vm_name
    vm_size                  = local.vm_size
    vm_admin                 = local.vm_admin
    vm_pass                  = local.vm_pass
    disk_caching             = local.disk_caching
    disk_strg_acc_type       = local.disk_strg_acc_type
    publisher                = local.publisher
    offer                    = local.offer
    sku                      = local.sku
    version                  = local.version
  }
}
