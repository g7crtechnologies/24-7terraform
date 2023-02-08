#Local Variable and accepting remote state data.

locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  vnet_name           = module.hub.vnet_name
  public_ip_map       = { for pip in var.public_ip_names : pip => true }

}

# module for hub environment
module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

# Module to create the resource group
module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

#---------------------------------------------------------
# Firewall Subnet Creation or selection
#----------------------------------------------------------
resource "azurerm_subnet" "fw-snet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.vnet_name
  address_prefixes     = var.firewall_subnet
}


#------------------------------------------
# Public IP resources for Azure Firewall
#------------------------------------------

resource "azurerm_public_ip" "fw-pip" {
  for_each            = local.public_ip_map
  name                = lower("tfs-pip-${var.firewall_config.name}-${each.key}-${local.loc_prefix}")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
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
  name                = format("%s", "tfs-fw-${var.firewall_config.name}-${local.loc_prefix}")
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
