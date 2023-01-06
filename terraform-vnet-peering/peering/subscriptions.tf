provider "azurerm" {
  alias           = "sub_destination"
  subscription_id = "a3d24929-6ecf-452d-815f-1aa613498e1c"

  features {}
}
provider "azurerm" {
  alias           = "sub_source"
  subscription_id = "efb95552-4a7d-4fc8-a8ba-c666c1faa870"
  features {}
}