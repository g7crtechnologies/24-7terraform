locals {
  inbound_endpoint_map  = { for inboundendpoint in var.dns_resolver_inbound_endpoints : inboundendpoint.inbound_endpoint_name => inboundendpoint }
  outbound_endpoint_map = { for outboundendpoint in var.dns_resolver_outbound_endpoints : outboundendpoint.outbound_endpoint_name => outboundendpoint }

  outbound_endpoint_forwarding_rule_sets = flatten([
    for outbound_endpoint_key, outboundendpoint in var.dns_resolver_outbound_endpoints : [
      for forwarding_rule_set_key, forwardingruleset in outboundendpoint.forwarding_rulesets : {
        outbound_endpoint_name  = outboundendpoint.outbound_endpoint_name
        forwarding_ruleset_name = forwardingruleset.forwarding_ruleset_name
        outbound_endpoint_id    = azurerm_private_dns_resolver_outbound_endpoint.private_dns_resolver_outbound_endpoint[outbound_endpoint_key.outbound_endpoint_name].id
      }
    ]
  ])
}