module "kv" {
  source         = "../tfs_azurerm_kv"
  key_vault_name = var.key_vault_name
  location       = var.location
  sku_name       = var.sku_name
  key_per        = var.key_per
  secret_per     = var.secret_per
  storage_per    = var.storage_per
  tags           = var.tags
}
