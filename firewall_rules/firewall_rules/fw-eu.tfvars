create_resource_group = false
resource_group_name   = "demo-RG"
location              = "eastus"
public_ip_names       = ["fw-public", "fw-private"]
firewall_config = {
  name     = "hub"
  sku_name = "AZFW_VNet"
  sku_tier = "Standard"
}
firewall_application_rules = [ {
  action = "Allow"
  description = "app_rule"
  fqdn_tags = [ "rule" ]
  name = "testcollection"
  protocol = {
    port = "443"
    type = "Https"
  }
  source_addresses = [ "10.88.0.0/23" ]
  source_ip_groups = [ "test" ]
  target_fqdns = [ "*.google.com" ]
} ]
firewall_nat_rules = [ {
  action = "Dnat"
  description = "nat_rule"
  destination_addresses = [ "10.88.0.0/21" ]
  destination_ports = [ "53" ]
  name = "nat_rule"
  protocols = [ "TCP" ]
  source_addresses = [ "10.3.0.0/24" ]
  translated_address = "8.8.8.8"
  translated_port = "53"
} ]
firewall_network_rules = [ {
  action = "Allow"
  description = "network_rule"
  destination_addresses = [ "8.8.8.8" ]
  destination_fqdns =null
  destination_ports = [ "53" ]
  name = "network_rule"
  protocols = [ "TCP" ]
  source_addresses = [ "10.2.0.0/24" ]
} ]
# Adding TAG's to your Azure resources 
tags = {
  ProjectName  = "demo-internal"
  Env          = "dev"
  Owner        = "user@example.com"
  BusinessUnit = "CORP"
  ServiceClass = "Gold"
}
