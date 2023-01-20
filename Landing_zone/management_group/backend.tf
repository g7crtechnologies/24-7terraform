#To store the tfstate in backend in storage account.
terraform {
  backend "azurerm" {
    resource_group_name  = "management_group"
    storage_account_name = "managementgroup123"
    container_name       = "managementgroup"
    key                  = ""
  }
} 