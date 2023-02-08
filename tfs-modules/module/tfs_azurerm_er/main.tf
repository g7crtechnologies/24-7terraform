# To call the resource group name & Vnet name from remote state
locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  vnet_name           = module.hub.vnet_name
}

# To Create the Gateway Subnet

module "hub" {
  source = "../tfs_azurerm_truth/hub"
  location = var.location
}

module "rg" {
  source = "../tfs_azurerm_truth/rg"
  location = var.location
}

resource "azurerm_subnet" "subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.vnet_name
  address_prefixes     = var.gateway_subnet
}

# To create the Express route Circuit

resource "azurerm_express_route_circuit" "er_circuit" {
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

#Creating Random string for domain name label

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
  location            = local.location
  resource_group_name = local.resource_group_name
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
  resource_group_name = local.resource_group_name
  location            = local.location
  type                = var.vng_config.type
  sku                 = var.vng_config.sku
  active_active       = var.vng_config.active_active

  ip_configuration {
    name                          = "tfs-pip-vgw-${var.vng_config.name}-${local.location}"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.subnet.id
  }
}
# Creation of Authorization of Express route of circuit 

resource "azurerm_express_route_circuit_authorization" "expressroute_cr" {
  name                       = "tfs-ergw-${var.authorization_name}-${local.location}"
  express_route_circuit_name = azurerm_express_route_circuit.er_circuit.name
  resource_group_name        = local.resource_group_name
}

#Connection between Source and Target

resource "azurerm_virtual_network_gateway_connection" "expressroute" {
  name                       = "tfs-vgw-${var.con_config.name}-${local.location}"
  resource_group_name        = local.resource_group_name
  location                   = local.location
  type                       = var.con_config.type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpngw.id
  authorization_key          = azurerm_express_route_circuit_authorization.expressroute_cr.authorization_key
  express_route_circuit_id   = azurerm_express_route_circuit.er_circuit.id

  depends_on = [
    azurerm_virtual_network_gateway.vpngw,azurerm_virtual_network_gateway_connection.expressroute
  ]
}
