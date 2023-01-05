data "azurerm_subscription" "current" {}
locals {
  parent                     = var.parent_management_group_name != null ? true : false
  parent_management_group_id = var.parent_management_group_id
  tenant_root_group_id       = "/providers/Microsoft.Management/managementGroups/${data.azurerm_subscription.current.tenant_id}"
  secrets_name               = var.secrets_name
  key_vault_name             = var.key_vault_name
  key_vault_rg_name          = var.key_vault_rg_name
  display_name               = "mg-${var.display_name}"
  parent_id                  = local.parent ? var.parent_management_group_id : local.tenant_root_group_id
}

module "mg" {
  source                       = "../../../module"
  parent_management_group_name = local.parent_id
  display_name                 = local.display_name
  secrets_name                 = local.secrets_name
  key_vault_name               = local.key_vault_name
  key_vault_rg_name            = local.key_vault_rg_name
  parent_management_group_id   = data.terraform_remote_state.env.outputs.mg_id
  subscription_enable          = true
}
