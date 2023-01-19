locals {
  default_instance_config = {
    // release_type = no default

    nic_name                 = "demo"
    ip_name                  = "cloud-platform"
    private_ip_address_alloc = "Dynamic"

    vm_name             = "micro"
    vm_size             = "Standard_F2"
    vm_admin            = "adminuser"
    vm_pass             = "Avinash@230799"
    disk_caching        = "ReadWrite"
    disk_strg_acc_type  = "Standard_LRS"
    publisher           = "Canonical"
    offer               = "UbuntuServer"
    sku                 = "16.04-LTS"
    version             = "latest"
  }

  // I is default instance config merged with incoming variable instance
  // config, but with the 'overrides' key removed
}
