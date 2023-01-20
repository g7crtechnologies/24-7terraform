#Module for Firewall
module "firewall" {
  source                                    = "../module/tfs_azurerm_firewall"
  location                                  = var.location
  firewall_subnet_address_prefix            = var.firewall_subnet_address_prefix
  create_resource_group                     = false
  enable_forced_tunneling                   = true
  firewall_management_subnet_address_prefix = var.firewall_management_subnet_address_prefix
  public_ip_names                           = ["fw-public", "fw-private"]
  firewall_config = {
    name     = var.firewall_config.name
    sku_name = var.firewall_config.sku_name
    sku_tier = var.firewall_config.sku_tier
  }
  # Adding TAG's to your Azure resources 
  tags = var.tags
}
