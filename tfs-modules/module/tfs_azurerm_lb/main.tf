# Local Variables and accepting remote state file for resource group and subnet
locals {
  resource_group_name = module.rg.rg_name
  location            = var.location == "eastus" ? "eu" : "wu"
  subnet = {
    (module.hub.lb) = ""
  }
  subnet_id = {
    (module.network.c2c_lb) = "-c2c",
    (module.network.cde_lb) = "-cde",
    (module.network.oos_lb) = "-oos",
  }
}

# Module to craete the resource group
module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

# Network Module
module "network" {
  source   = "../tfs_azurerm_truth/network"
  location = var.location
}

# Hub module
module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
  providers = {
    azurerm = azurerm.hub
   }
}

#------------------------------------------
# Load Balancer
#------------------------------------------

resource "azurerm_lb" "lb" {
  for_each            = [terraform.workspace] == "hub" ? local.subnet : local.subnet_id
  name                = "${var.prefix}-${terraform.workspace}${each.value}-${local.location}-speech"
  location            = var.location
  resource_group_name = local.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "${var.prefix}-${terraform.workspace}${each.value}-${local.location}-speech-fip"
    subnet_id                     = each.key
    private_ip_address_allocation = lookup(each.value, "static_ip", null) == null ? "dynamic" : "static"
    private_ip_address            = lookup(each.value, "static_ip", null)
  }

  tags = var.tags
}
