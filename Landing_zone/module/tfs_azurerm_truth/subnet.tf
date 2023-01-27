variable "location" {
  type        = string
  description = "location of subnet"
}
#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#------------------------------------------
# Remote State file for Subnet
#------------------------------------------
data "terraform_remote_state" "subnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-${local.loc_prefix}-tfstate"
    storage_account_name = "tfsstrg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/vnet/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"

  }
}
#------------------------------------------
# Output of subnets
#------------------------------------------

### hub subnet id
output "firewall" {
  value = data.terraform_remote_state.subnet.outputs.firewall
}
output "mgmt" {
  value = data.terraform_remote_state.subnet.outputs.mgmt
}
output "app-gw" {
  value = data.terraform_remote_state.subnet.outputs.app-gw
}
output "lb" {
  value = data.terraform_remote_state.subnet.outputs.lb
}
output "gateway" {
  value = data.terraform_remote_state.subnet.outputs.gateway
}

## other vnets subnet id
output "c2c_app" {
  value = data.terraform_remote_state.subnet.outputs.c2c_app
}
output "c2c_app_db" {
  value = data.terraform_remote_state.subnet.outputs.c2c_app_db
}
output "c2c_lb" {
  value = data.terraform_remote_state.subnet.outputs.c2c_lb
}
output "cde_app" {
  value = data.terraform_remote_state.subnet.outputs.cde_app
}
output "cde_ap_db" {
  value = data.terraform_remote_state.subnet.outputs.cde_ap_db
}
output "cde_lb" {
  value = data.terraform_remote_state.subnet.outputs.cde_lb
}
output "oos_app" {
  value = data.terraform_remote_state.subnet.outputs.oos_app
}
output "oos_app_db" {
  value = data.terraform_remote_state.subnet.outputs.oos_app_db
}
output "oos_lb" {
  value = data.terraform_remote_state.subnet.outputs.oos_lb
}






