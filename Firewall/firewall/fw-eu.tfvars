
resource_group_name                       = "demo-RG"
location                                  = "eastus"
virtual_network_name                      = "tfs-vnet-hub-eu"
firewall_subnet_address_prefix            = ["10.0.0.0/24"]
create_resource_group                     = false
enable_forced_tunneling                   = true
firewall_management_subnet_address_prefix = ["10.0.1.0/24"]
public_ip_names                           = ["fw-public", "fw-private"]
firewall_config = {
  name     = "hub"
  sku_name = "AZFW_VNet"
  sku_tier = "Standard"
}
# Adding TAG's to your Azure resources 
tags = {
  ProjectName  = "demo-internal"
  Env          = "dev"
  Owner        = "user@example.com"
  BusinessUnit = "CORP"
  ServiceClass = "Gold"
}
