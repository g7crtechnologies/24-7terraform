location                         = "Central india"
resource_group_name              = "dns-rg"
virtual_network_name             = "dns-vnet"
virtual_network_address_space    = ["10.1.0.0/16"]
inbound_subnet_address_prefixes  = ["10.1.0.0/24"]
outbound_subnet_address_prefixes = ["10.1.1.0/24"]
dns_resolver_name                = "test-dns-private-resolver"
private_dns_zone_name            = "mypvtdns.com"
forwarding_ruleset_name          = "default-ruleset"
tags = {
  Configuration = "Terraform"
}
subnet_name1 = "subnet1"
subnet_name2 = "subnet2"
