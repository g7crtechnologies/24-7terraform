#------------------------------------------
# Local Variables and accepting value from remote state
#------------------------------------------
locals {
  resource_group_name = data.terraform_remote_state.rg.outputs.rg_name
  location            = var.location
  vnet_name           = data.terraform_remote_state.vnet.outputs.vnet_name
}
#------------------------------------------
# Storage Account
#------------------------------------------
resource "azurerm_storage_account" "storageacc" {
  for_each = var.env
  name                     = "tfsstrg${terraform.workspace}tfstate"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

#------------------------------------------
# Storage account Container
#------------------------------------------
resource "azurerm_storage_container" "container" {
  for_each = var.env
  name                  = "${terraform.workspace}tfstate"
  storage_account_name  = azurerm_storage_account.storageacc.name
  container_access_type = var.container_access_type
}
