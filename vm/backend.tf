terraform {
  backend "azurerm" {
    resource_group_name  = "backend-247"
    storage_account_name = "247testtfstorage1"
    container_name       = "test"
    key                  = "vm/terraform.tfstate"
  }
} 