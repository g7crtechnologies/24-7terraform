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

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.address_space[terraform.workspace]
  name                = "tfs-vnet-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = each.value["address_space"]
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_prefixes[terraform.workspace]
  address_prefixes     = each.value["address_prefixes"]
  name                 = "tfs-snet-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.skey].name
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.subnet_prefixes[terraform.workspace]
  name                = "tfs-nsg-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
}

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  for_each                  = var.subnet_prefixes[terraform.workspace]
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.subnet
  ]
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
  subnet_id      = azurerm_subnet.subnet[each.key].id
    depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.subnet
  ]
}
