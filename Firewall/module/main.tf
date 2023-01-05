locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
  public_ip_map       = { for pip in var.public_ip_names : pip => true }

}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# Firewall Subnet Creation or selection
#----------------------------------------------------------
data "azurerm_subnet" "fw-snet" {
  name                 = ""
  resource_group_name  = local.resource_group_name
  virtual_network_name = var.virtual_network_name
}

#---------------------------------------------------------
# Firewall Managemnet Subnet Creation
#----------------------------------------------------------
data "azurerm_subnet" "fw-mgnt-snet" {
  count                = var.enable_forced_tunneling ? 1 : 0
  name                 = ""
  resource_group_name  = local.resource_group_name
  virtual_network_name = var.virtual_network_name

}

#------------------------------------------
# Public IP resources for Azure Firewall
#------------------------------------------
resource "azurerm_public_ip_prefix" "fw-pref" {
  name                = lower("tfs-pip-${var.firewall_config.name}-prefix-${local.location}")
  resource_group_name = local.resource_group_name
  location            = local.location
  prefix_length       = var.public_ip_prefix_length
  tags                = merge({ "ResourceName" = lower("tfs-pip-${var.firewall_config.name}-prefix-${local.location}") }, var.tags, )
}

resource "azurerm_public_ip" "fw-pip" {
  for_each            = local.public_ip_map
  name                = lower("tfs-pip-${var.firewall_config.name}-${each.key}-${local.location}")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  public_ip_prefix_id = azurerm_public_ip_prefix.fw-pref.id
  tags                = merge({ "ResourceName" = lower("tfs-pip-${var.firewall_config.name}-${each.key}") }, var.tags, )
}

resource "azurerm_public_ip" "fw-mgnt-pip" {
  count               = var.enable_forced_tunneling ? 1 : 0
  name                = lower("tfs-pip-${var.firewall_config.name}-fw-mgnt")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = merge({ "ResourceName" = lower("pip-${var.firewall_config.name}-fw-mgnt") }, var.tags, )
}

#-----------------
# Azure Firewall 
#-----------------
resource "azurerm_firewall" "fw" {
  name                = format("%s", "tfs-fw-${var.firewall_config.name}-${local.location}")
  resource_group_name = local.resource_group_name
  location            = local.location
  sku_name            = var.firewall_config.sku_name
  sku_tier            = var.firewall_config.sku_tier
  tags                = merge({ "ResourceName" = format("%s", var.firewall_config.name) }, var.tags, )

dynamic "ip_configuration" {
    for_each = local.public_ip_map
    iterator = ip
    content {
      name                 = ip.key
      subnet_id            = ip.key == var.public_ip_names[0] ? azurerm_subnet.fw-snet.id : null
      public_ip_address_id = azurerm_public_ip.fw-pip[ip.key].id
    }
  }
}
