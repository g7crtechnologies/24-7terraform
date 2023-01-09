create_resource_group = true
resource_group_name   = "demo-RG"
location              = "westus"
public_ip_names       = ["fw-public", "fw-private"]
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
