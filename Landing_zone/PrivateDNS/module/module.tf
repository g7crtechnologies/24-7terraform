module "dnsresolver" {
  source                = "../dns"
  private_dns_zone_name = "mypvtdns.com"
  resource_group_name   = var.resource_group_name
  location              = var.location
  dns_resolver_name     = var.dns_resolver_name
  tags                  = var.tags
  virtual_network_name  = var.virtual_network_name
  subnet_name1          = "subnet1"
  subnet_name2          = "subnet2"

  dns_resolver_inbound_endpoints = [
    # There is currently only support for two Inbound endpoints per Private Resolver.
    {
      inbound_endpoint_name = "inbound"
    }
  ]

  dns_resolver_outbound_endpoints = [
    # There is currently only support for two Outbound endpoints per Private Resolver.
    {
      outbound_endpoint_name = "outbound"
      forwarding_rulesets = [
        # There is currently only support for two DNS forwarding rulesets per outbound endpoint.
        {
          forwarding_ruleset_name = var.forwarding_ruleset_name
        }
      ]
    }
  ]
}
