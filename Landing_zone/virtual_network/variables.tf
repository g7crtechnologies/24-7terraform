variable "address_space" {
  type = map(map(object({
    name          = string
    address_space = list(string)
    product       = string
  })))
  description = "The address space that is used by the virtual network."
  default = {
    "prod" = {
      "prod-c2c" = {
        address_space = ["10.89.0.0/20"]
        name          = "prod-c2c"
        product       = "aiva"
      }
    }
  }
}

variable "region" {
  description = "pci_type name for naming convention"
  type        = string
  default     = "eu"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
  default = {
    "owner" = "g7"
  }
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = any
  default = {
    hub1 = {
      name             = "azurefirewall"
      address_prefixes = ["10.88.48.0/26"]
      skey             = "hub"
      product          = "aiva"
    }
  }
}
variable "location" {
  description = "location of vnets"
  type        = string
  default     = "eastus"
}


