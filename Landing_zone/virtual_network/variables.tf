variable "address_space" {
  type = map(map(object({
    name          = string
    address_space = list(string)
    product       = string
  })))
  description = "The address space that is used by the virtual network."
}

variable "region" {
  description = "pci_type name for naming convention"
  type        = string
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = any
}

variable "location" {
  description = "location of vnets"
  type        = string
}


