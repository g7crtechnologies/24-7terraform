data "azurerm_storage_account" "diagnostic" {
  name                = "zsoyodsdiagnosticlogs"
  resource_group_name = "zs-oyo-common-datastores"
}
