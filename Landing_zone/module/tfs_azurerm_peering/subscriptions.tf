provider "azurerm" {
  alias           = "dev"
  subscription_id = "a3d24929-6ecf-452d-815f-1aa613498e1c"

  features {}
}
provider "azurerm" {
  alias           = "hub"
  subscription_id = "b73f96a1-880b-4226-9e70-bf1a90ab59f7"
  features {}
}
provider "azurerm" {
  alias           = "qa"
  subscription_id = "b88a3954-17c7-4576-8d74-586ea43d7d2d"
  features {}
}
provider "azurerm" {
  alias           = "stg"
  subscription_id = "a98702d2-48f7-4aba-9fe6-b568d7487210"
  features {}
}
provider "azurerm" {
  alias           = "stb"
  subscription_id = "14d3f616-f754-40e5-a37e-925bfd2e4480"
  features {}
}
provider "azurerm" {
  alias           = "prod"
  subscription_id = "16d401c3-90cd-466a-a075-27c333d16bce"
  features {}
}
provider "azurerm" {
  alias           = "psr"
  subscription_id = "f55584c8-fc18-47da-bf63-75f4d3951ae3"
  features {}
}