locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rg.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

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

data "azurerm_virtual_network" "vnet" {
  for_each            = var.address_space[terraform.workspace]
  name                = "tfs-vnet-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.subnet_prefixes[terraform.workspace]
  name                 = "tfs-snet-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet[each.value.skey].name
}

resource "azurerm_route_table" "route_table" {
  for_each            = var.subnet_prefixes[terraform.workspace]
  name                = "tfs-rt-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
}

resource "azurerm_subnet_route_table_association" "sub_rt" {
  for_each       = var.subnet_prefixes[terraform.workspace]
  route_table_id = azurerm_route_table.route_table[each.key].id
  subnet_id      = data.azurerm_subnet.subnet[each.key].id
}
