module "firewall" {
  source                = "../module"
  resource_group_name   = var.resource_group_name
  location              = var.location
  create_resource_group = false
  public_ip_names       = ["fw-public", "fw-private"]
  firewall_config = {
    name     = var.firewall_config.name
    sku_name = var.firewall_config.sku_name
    sku_tier = var.firewall_config.sku_tier
  }
  firewall_application_rules = var.firewall_application_rules
  firewall_nat_rules         = var.firewall_nat_rules
  firewall_network_rules     = var.firewall_network_rules
  # Adding TAG's to your Azure resources 
  tags = {
    ProjectName  = "demo-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
