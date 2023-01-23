data "azurerm_subscription" "current" {}
#------------------------------------------
# Local Varaibles
#------------------------------------------
locals {
  parent                     = var.parent_management_group_name != null ? true : false
  parent_management_group_id = var.parent_management_group_id
  tenant_root_group_id       = "/providers/Microsoft.Management/managementGroups/${data.azurerm_subscription.current.tenant_id}"
  secrets_name               = var.secrets_name
  key_vault_name             = var.key_vault_name
  key_vault_rg_name          = var.key_vault_rg_name
  display_name               = var.display_name
  parent_id                  = local.parent ? var.parent_management_group_id : local.tenant_root_group_id
}
#------------------------------------------
# Data Sources of Key Vault
#------------------------------------------

data "azurerm_key_vault" "key_vault" {
  name                = local.key_vault_name
  resource_group_name = local.key_vault_rg_name

}
#------------------------------------------
# Data Sources of Key Vault Secret
#------------------------------------------

data "azurerm_key_vault_secret" "secrets" {
  name         = local.secrets_name
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

#------------------------------------------
# Management Group
#------------------------------------------

resource "azurerm_management_group" "mg" {

  display_name               = local.display_name
  name                       = local.display_name
  parent_management_group_id = var.pid == true ? local.parent_id : var.remote_state
  subscription_ids           = var.subscription_enable == true ? [data.azurerm_key_vault_secret.secrets.value] : null
}
