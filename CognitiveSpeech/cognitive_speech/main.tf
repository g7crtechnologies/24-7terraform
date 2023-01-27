module "cognitive_speech" {
  source              = "../tfs_azurerm_cs"
  resource_group_name = var.resource_group_name
  location            = var.location
  account_name        = var.account_name
  kind                = var.kind
  sku_name            = var.sku_name
  tags                = var.tags
}
