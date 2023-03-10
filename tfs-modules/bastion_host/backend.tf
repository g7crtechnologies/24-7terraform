#Local variable to define region and prefix
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

# To store the tfstate in backend in storage account.
terraform {
  backend "azurerm" {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/bastion_host/${terraform.workspace}/default.tfstate"
  }
} 