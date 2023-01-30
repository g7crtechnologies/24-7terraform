locals {
  resource_group_name = module.truth.rg_name
  location            = var.location
}

module "truth" {
  source   = "../tfs_azurerm_truth"
  location = var.location
}

resource "azurerm_key_vault" "kv" {
  name                        = "tfs-kv${var.key_vault_name}-speech"
  location                    = local.location
  resource_group_name         = local.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = var.sku_name

  access_policy {
    tenant_id           = data.azurerm_client_config.current.tenant_id
    object_id           = data.azurerm_client_config.current.object_id
    key_permissions     = var.key_per
    secret_permissions  = var.secret_per
    storage_permissions = var.storage_per
  }
}
