module "ExpressRoute" {
  source                = "../module"
  resource_group_name   = var.resource_group_name
  location              = var.location
  virtual_network_name  = var.virtual_network_name
  subnet_name           = var.subnet_name
  public_ip_sku         = var.public_ip_sku
  pip_allocation_method = var.pip_allocation_method
  authorization_name    = var.authorization_name
  vng_config            = var.vng_config
  sku                   = var.sku
  con_config            = var.con_config
  er_config             = var.er_config
}

