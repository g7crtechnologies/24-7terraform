data "terraform_remote_state" "es" {
  backend = "azurerm"
  config = {
    resource_group_name  = "backend-247"
    storage_account_name = "247testtfstorage1"
    container_name       = "test"
    key                  = "vnet/terraform.tfstate"
  }
}