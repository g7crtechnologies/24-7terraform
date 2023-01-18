terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "infra" {
  for_each = var.env
  name     = "tfs-rg-${each.key}-${var.region}-${each.key}"
  location = var.location
  tags     = var.tags
}

output "rg" {
  value = [for v in azurerm_resource_group.infra: v.name]
}