data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "dns" {
  count               = var.private_dns_zone_name == null ? 0 : 1
  name                = var.private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_virtual_network" "vnet" {
  name                = lower("${var.virtual_network_name}")
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Creating Inbound Subnet, note there is only support for two inbound endpoints per DNS Resolver, and they cannot share the same subnet.

data "azurerm_subnet" "inbound" {
  name                 = lower("${var.subnet_name1}")
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

# Creating Outbound Subnet, note there is only support for two outbound endpoints per DNS Resolver, and they cannot share the same subnet.
data "azurerm_subnet" "outbound" {
  name                 = lower("${var.subnet_name2}")
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_resolver" "private_dns_resolver" {
  name                = var.dns_resolver_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = data.azurerm_virtual_network.vnet.id
  tags                = var.tags
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "private_dns_resolver_inbound_endpoint" {
  for_each                = local.inbound_endpoint_map
  name                    = each.value.inbound_endpoint_name
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver.id
  location                = var.location
  tags                    = var.tags

  ip_configurations {
    private_ip_allocation_method = "Dynamic" # Dynamic is default and only supported.
    subnet_id                    = data.azurerm_subnet.inbound.id
  }
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "private_dns_resolver_outbound_endpoint" {
  for_each                = local.outbound_endpoint_map
  name                    = each.value.outbound_endpoint_name
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver.id
  location                = var.location
  subnet_id               = data.azurerm_subnet.outbound.id
  tags                    = var.tags
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "forwarding_ruleset" {
  for_each = {
    for forwarding_rule_set in local.outbound_endpoint_forwarding_rule_sets : "${forwarding_rule_set.outbound_endpoint_name}-${forwarding_rule_set.forwarding_ruleset_name}" => forwarding_rule_set
  }
  name                                       = each.value.forwarding_ruleset_name
  resource_group_name                        = var.resource_group_name
  location                                   = var.location
  private_dns_resolver_outbound_endpoint_ids = [each.value.outbound_endpoint_id]
  tags                                       = var.tags
}