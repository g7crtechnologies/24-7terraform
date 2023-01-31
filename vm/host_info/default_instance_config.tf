locals {
  default_instance_config = {
    // release_type = no default

    nic_name                 = "demo"
    ip_name                  = "cloud-platform"
    private_ip_address_alloc = "Dynamic"

    vm_name                          = "micro"
    vm_size                          = "Standard_F2"
    vm_pass                          = "Avinash@230799"
    disk_caching                     = "ReadWrite"
    disk_strg_acc_type               = "Standard_LRS"
    publisher                        = "Canonical"
    offer                            = "UbuntuServer"
    sku                              = "16.04-LTS"
    version                          = "latest"
    enable_vm_availability_set       = true
    platform_fault_domain_count      = "2"
    platform_update_domain_count     = "2"
    enable_proximity_placement_group = true
    data_disk_name                   = ["data_disk_01", "data_disk_02"]
    resource_group_location          = "eastus"
    data_disk_storage_acc_type       = "Standard_LRS"
    disk_size_gb                     = "32"
    enable_encryption_at_host        = false
    vm_availability_zone             = "1"
    instances_count                  = "1"
    disable_password_authentication  = true
    admin_username                   = "azureadmin"
    admin_ssh_key_data               = null
    enable_boot_diagnostics          = true
    storage_account_name             = null
    storage_account_uri              = "https://tfsstorageacc.blob.core.windows.net/"
    pvt_dns_zone_name                = "contoso.internal"
    pvt_rg_name                      = "tfvmex-resources"
    data_disk_lun                    = "10"
    caching_type                     = "ReadWrite"
    tags = {
      terraform   = "1"
      environment = "dev"
    }
  }

  // I is default instance config merged with incoming variable instance
  // config, but with the 'overrides' key removed
}
