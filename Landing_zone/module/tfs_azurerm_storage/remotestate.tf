#------------------------------------------
#Local Variables
#------------------------------------------
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#------------------------------------------
# Remote State file for Resource group
#------------------------------------------
data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-${local.loc_prefix}-tfstate"
    storage_account_name = "tfsstrg${terraform.workspace}tfstate"
    container_name       = "${terraform.workspace}tfstate"
    key                  = "${local.environment}/rg/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"

  }
}


