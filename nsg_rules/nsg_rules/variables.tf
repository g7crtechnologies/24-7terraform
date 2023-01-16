variable "create_resource_group" {
  description = "Name of the resource group to be imported."
  type        = bool
  default     = false
}

variable "existing_resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location of the vnet to create."
  type        = string
}

variable "subscription_id" {
  type = map(any)
}

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

variable "component" {
  description = "environment name for naming convention"
  type        = any
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = any
}

variable "nsg_rule" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = optional(string)
    destination_port_ranges    = optional(list(string))
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = {}
  description = "network security rules for nsg"
}


