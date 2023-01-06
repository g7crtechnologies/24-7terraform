locals {            
  vnet_rg_sub_source        = var.rg_sub_source
  vnet_name_sub_source      = var.vnet_name_sub_source
  vnet_rg_sub_destination   = var.rg_sub_destination
  vnet_name_sub_destination = var.vnet_name_sub_destination
}

#Using existing virtual network that is in exesting RG under  Subscription source
data "azurerm_virtual_network" "vnet_source" {
  provider            = azurerm.sub_source
  name                = local.vnet_name_sub_source
  resource_group_name = local.vnet_rg_sub_source
}

#Using existing virtual network that is in exesting RG under  Subscription destination
data "azurerm_virtual_network" "vnet_destination" {
  provider            = azurerm.sub_destination
  name                = local.vnet_name_sub_destination
  resource_group_name = local.vnet_rg_sub_destination
}

#Creating Peering source to destination
resource "azurerm_virtual_network_peering" "peering_source_to_destination" {
  provider                     = azurerm.sub_source
  name                         = var.peering_name_source
  resource_group_name          = local.vnet_rg_sub_source
  virtual_network_name         = local.vnet_name_sub_source
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet_destination.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

#Creating Peering destination to source
resource "azurerm_virtual_network_peering" "peering_destination_to_source" {
  provider                     = azurerm.sub_destination
  name                         = var.peering_name_destination
  resource_group_name          = local.vnet_rg_sub_destination
  virtual_network_name         = local.vnet_name_sub_destination
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet_source.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

