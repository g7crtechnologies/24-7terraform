data "azurerm_resource_group" "lb" {
  name = var.resource_group_name
}

locals {
  location = var.location == "" ? data.azurerm_resource_group.lb.location : var.location
  tags     = data.azurerm_resource_group.lb.tags
}

data "azurerm_subnet" "subnet" {
  for_each             = var.subnet_name
  name                 = each.value["name"]
  virtual_network_name = each.value["virtual_network_name"]
  resource_group_name  = var.resource_group_name
}

resource "azurerm_lb" "lb" {
  for_each            = var.Lbs
  name                = "${var.prefix}-${each.value["env"]}-${each.value["pci"]}-lb${local.location}"
  location            = local.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "${var.prefix}-${each.value["env"]}-${each.value["pci"]}-lb${local.location}-fip"
    subnet_id                     = data.azurerm_subnet.subnet[each.value.snet_key].id
    private_ip_address_allocation = lookup(each.value, "static_ip", null) == null ? "dynamic" : "static"
    private_ip_address            = lookup(each.value, "static_ip", null)
  }

  tags = local.tags
}

# resource "azurerm_lb_backend_address_pool" "lb_backend" {
#   for_each = var.Lbs
#   name     = "${var.prefix}-${each.value["env"]}-${each.value["pci"]}-${local.location}-bckpool"

#   #This forces a destroy when adding a new lb --> loadbalancer_id     = lookup(azurerm_lb.lb, each.key)["id"]
#   loadbalancer_id = lookup(azurerm_lb.lb, each.key)["id"]
# }

# resource "azurerm_lb_probe" "lb_probe" {
#   for_each     = var.LbRules
#   name         = "${var.prefix}-${each.value["env"]}-${each.value["pci"]}-lb${local.location}-probe${each.value["Id"]}"
#   port         = each.value["probe_port"]
#   protocol     = each.value["probe_protocol"]
#   request_path = each.value["probe_protocol"] == "Tcp" ? "" : each.value["request_path"]
#   #This forces a destroy when adding a new lb --> loadbalancer_id     = lookup(azurerm_lb.lb, each.value["lb_key"])["id"]
#   loadbalancer_id = lookup(azurerm_lb.lb, each.value["lb_key"])["id"]
# }

# resource "azurerm_lb_rule" "lb_rule" {
#   for_each                       = var.LbRules
#   name                           = "${var.prefix}-${each.value["suffix_name"]}-rule${each.value["Id"]}"
#   protocol                       = "Tcp"
#   frontend_port                  = each.value["lb_port"]
#   backend_port                   = each.value["backend_port"]
#   frontend_ip_configuration_name = "${var.prefix}-${each.value["suffix_name"]}-nic1-LBCFG"
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend[each.value.lb_key].id]
#   probe_id                       = lookup(azurerm_lb_probe.lb_probe, each.key)["id"]
#   load_distribution              = each.value["load_distribution"]
#   idle_timeout_in_minutes        = 4
#   #This forces a destroy when adding a new lb --> loadbalancer_id     = lookup(azurerm_lb.lb, each.value["lb_key"])["id"]
#   loadbalancer_id = lookup(azurerm_lb.lb, each.value["lb_key"])["id"]
# }
