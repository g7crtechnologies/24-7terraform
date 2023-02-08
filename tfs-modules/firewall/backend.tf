#Local variable to define region and prefix

locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#Calling terraform tfstate file from backend

terraform {
  backend "azurerm" {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/firewall/${terraform.workspace}/default.tfstate"
  }
} 