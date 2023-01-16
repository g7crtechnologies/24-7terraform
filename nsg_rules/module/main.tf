#------------------------------------------------------------
# Local configuration - Default (required). 
#------------------------------------------------------------

locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
data "azurerm_resource_group" "rg" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.existing_resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group == true ? 1 : 0
  name     = "tfs-rg-${terraform.workspace}-${var.region}-${var.component[terraform.workspace]}"
  location = var.location
  tags     = merge({ "Name" = format("%s", var.existing_resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# NSG Creation with NSG-Rules
#----------------------------------------------------------
data "azurerm_network_security_group" "nsg" {
  for_each            = var.subnet_prefixes[terraform.workspace]
  name                = "tfs-nsg-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
}


resource "azurerm_network_security_rule" "infra" {
  for_each                    = var.nsg_rule
  name                        = each.value["name"]
  priority                    = each.value["priority"]
  direction                   = each.value["direction"]
  access                      = each.value["access"]
  protocol                    = each.value["protocol"]
  source_port_range           = each.value["source_port_range"]
  destination_port_range      = each.value["destination_port_range"]
  destination_port_ranges     = each.value["destination_port_ranges"]
  source_address_prefix       = each.value["source_address_prefix"]
  destination_address_prefix  = each.value["destination_address_prefix"]
  resource_group_name         = local.resource_group_name
  network_security_group_name = data.azurerm_network_security_group.infra.name
}

