#Local Variable and accepting remote state data.

locals {
  resource_group_name = module.truth.rg_name
  location            = var.location
  vnet_name           = module.truth.vnet_name
  public_ip_map       = { for pip in var.public_ip_names : pip => true }

}

module "truth" {
  source = "../tfs_azurerm_truth"
  location = var.location
}

#---------------------------------------------------------
# Firewall Subnet Creation or selection
#----------------------------------------------------------
resource "azurerm_subnet" "fw-snet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.vnet_name
  address_prefixes     = ["10.86.50.0/26"]
}

#------------------------------------------
# Public IP prefix for Azure Firewall
#------------------------------------------
resource "azurerm_public_ip_prefix" "fw-pref" {
  name                = lower("tfs-pip-${var.firewall_config.name}-prefix-${local.location}")
  resource_group_name = local.resource_group_name
  location            = local.location
  prefix_length       = var.public_ip_prefix_length
  tags                = merge({ "ResourceName" = lower("tfs-pip-${var.firewall_config.name}-prefix-${local.location}") }, var.tags, )
}

#------------------------------------------
# Public IP resources for Azure Firewall
#------------------------------------------

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
