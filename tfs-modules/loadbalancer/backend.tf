# To store the tfstate in backend in storage account.

terraform {
  backend "azurerm" {
    resource_group_name  = "tfs-rg-dev-tfstate"
    storage_account_name = "tfsstgdevtfstate"
    container_name       = "tfstate"
    key                  = "eastus/loadbalancer/dev/default.tfstate"
  }
} 