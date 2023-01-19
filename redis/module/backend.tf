terraform {
  backend "azurerm" {
    resource_group_name  = "zs-oyorooms-tf"
    storage_account_name = "zsoyoroomstf"
    container_name       = "nonprod"
    key                  = "redis/terraform.tfstate"
  }
} 