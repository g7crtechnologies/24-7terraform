#------------------------------------------
# Module for Storage Account
#------------------------------------------
module "storage" {
  source                   = "../module/tfs_azurerm_storage"
  location                 = var.location
  env                      = var.env
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  container_access_type    = var.container_access_type
  tags                     = var.tags
}
