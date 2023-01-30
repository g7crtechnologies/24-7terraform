key_vault_name = "hub"
location       = "eastus"
sku_name       = "standard"
key_per        = ["Get"]
secret_per     = ["Get"]
storage_per    = ["Get"]
tags = {
  "environment" = "hub"
}