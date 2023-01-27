# Local Variables and accepting remote state file for resource group and subnet
locals {
  resource_group_name = module.truth.rg_name
  location            = var.location
  subnet              = module.truth.lb
}
 
module "truth" {
  source = "../tfs_azurerm_truth"
  location = var.location
}


#------------------------------------------
# Load Balancer
#------------------------------------------

resource "azurerm_lb" "lb" {
  for_each            = var.lbs[terraform.workspace]
  name                = "${var.prefix}-${each.value["name"]}-${each.value["description"]}-${local.location}"
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "${var.prefix}-${each.value["name"]}-${each.value["description"]}-lb${local.location}-fip"
    subnet_id                     = local.subnet
    private_ip_address_allocation = lookup(each.value, "static_ip", null) == null ? "dynamic" : "static"
    private_ip_address            = lookup(each.value, "static_ip", null)
  }
  
  tags = var.tags
}
