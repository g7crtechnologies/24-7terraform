locals {
  resource_group_name = "network"
  location            = "centralindia"
}
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "snet" {
  name                 = "tfs-vgw-hub"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

resource "azurerm_express_route_circuit" "er" {
  name                     = "tfs-ergw-${var.er_config.name}-${local.location}"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  service_provider_name    = var.er_config.service_provider_name
  peering_location         = var.er_config.peering_location
  bandwidth_in_mbps        = var.er_config.bandwidth_in_mbps
  allow_classic_operations = var.er_config.allow_classic_operations
  sku {
    tier   = var.sku.tier
    family = var.sku.family
  }

  tags = merge({ "ResourceName" = lower("tfs-ergw-${var.vng_config.name}-${local.location}") }, var.tags, )
}

resource "random_string" "str" {
  length  = 6
  special = false
  upper   = false
  keepers = {
    domain_name_label = var.vng_config.name
  }
}

#---------------------------------------------
# Public IP for Virtual Network Gateway
#---------------------------------------------
resource "azurerm_public_ip" "pip_gw" {
  name                = lower("tfs-pip-vgw-${var.vng_config.name}")
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = var.pip_allocation_method
  sku                 = var.public_ip_sku
  domain_name_label   = format("gw%s%s", lower(replace(var.vng_config.name, "/[[:^alnum:]]/", "")), random_string.str.result)
  tags                = merge({ "ResourceName" = lower("tfs-pip-${var.vng_config.name}") }, var.tags, )
}

#-------------------------------
# Virtual Network Gateway 
#-------------------------------
resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = "tfs-vgw-${var.vng_config.name}-${local.location}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  type                = var.vng_config.type
  sku                 = var.vng_config.sku
  active_active       = var.vng_config.active_active

  ip_configuration {
    name                          = "tfs-pip-vgw-${var.vng_config.name}-${local.location}"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.snet.id
  }
}
resource "azurerm_express_route_circuit_authorization" "example" {
  name                       = "tfs-ergw-${var.authorization_name}-${local.location}"
  express_route_circuit_name = azurerm_express_route_circuit.er.name
  resource_group_name        = local.resource_group_name
}
resource "azurerm_virtual_network_gateway_connection" "expressroute" {
  name                       = "tfs-vgw-${var.con_config.name}-${local.location}"
  resource_group_name        = data.azurerm_resource_group.rg.name
  location                   = data.azurerm_resource_group.rg.location
  type                       = var.con_config.type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpngw.id
  authorization_key          = var.con_config.authorization_key
  express_route_circuit_id   = azurerm_express_route_circuit.er.id
}
