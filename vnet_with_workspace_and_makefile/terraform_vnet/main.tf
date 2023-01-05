module "name" {
  source                       = "../module"
  create_resource_group        = var.create_resource_group
  existing_resource_group_name = var.existing_resource_group_name
  location                     = var.location
  subscription_id              = var.subscription_id
  address_space                = var.address_space
  region                       = var.region
  tags                         = var.tags
  component                    = var.component
  subnet_prefixes              = var.subnet_prefixes
}
