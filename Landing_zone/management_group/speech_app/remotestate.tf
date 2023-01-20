#To call remote State file in different-different block of code
data "terraform_remote_state" "speech-application" {
  backend = "azurerm"
  config = {
    resource_group_name  = "management_group"
    storage_account_name = "managementgroup123"
    container_name       = "managementgroup"
    key                  = "mg/products/default.tfstate"
  }
}