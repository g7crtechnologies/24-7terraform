locals {
  # all env vnet id and name
  source_vnet_name = {
    (module.truth.vnet_c2c_name) = "c2c",
    (module.truth.vnet_cde_name) = "cde",
    (module.truth.vnet_oos_name) = "oos",
  }
  source_vnet_id = {
    (module.truth.vnet_c2c) = "c2c",
    (module.truth.vnet_cde) = "cde",
    (module.truth.vnet_oos) = "oos",
  }
  # all environment rg name
  source_rg = data.terraform_remote_state.rg.outputs.rg_name
  env_name = {
    "hub"  = "hub"
    "dev"  = "dev"
    "psr"  = "psr"
    "qa"   = "qa"
    "prod" = "prod"
    "stg"  = "stg"
    "stb"  = "stb"
  }
}
module "truth" {
  source = "../tfs_azurerm_truth"
}


data "azurerm_virtual_network" "hub" {
  provider = azurerm.hub
  name = var.location == "eastus" ? "tfs-vnet-hub-eu-aiva" : "tfstfs-vnet-hub-wu-aiva"
  resource_group_name = var.location == "eastus" ? "tfs-rg-hub-eu-speech" : "tfstfs-rg-hub-wu-speech"
}

#Creating Peering source to destination
resource "azurerm_virtual_network_peering" "peering_source_to_destination" {
  for_each                     = local.source_vnet_name
  name                         = "${local.env_name[terraform.workspace]}-${each.value}-to-hub"
  resource_group_name          = local.source_rg
  virtual_network_name         = each.key
  remote_virtual_network_id    = data.azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

#Creating Peering destination to source
resource "azurerm_virtual_network_peering" "peering_destination_to_source" {
  for_each                     = local.source_vnet_id
  provider                     = azurerm.hub
  name                         = "hub-to-${local.env_name[terraform.workspace]}-${each.value}"
  resource_group_name          = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.hub.name
  remote_virtual_network_id    = each.key
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

