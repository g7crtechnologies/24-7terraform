data "terraform_remote_state" "env" {
  backend = "azurerm"
  config = {
    resource_group_name  = "management_group"
    storage_account_name = "managementgroup123"
    container_name       = "managementgroup"
    key                  = "mg/products/speech-application/default.tfstate"
  }
}

