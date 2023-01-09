variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = false
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}


variable "public_ip_names" {
  description = "Public ips is a list of ip names that are connected to the firewall. At least one is required."
  type        = list(string)
  default     = ["fw-public"]
}

variable "firewall_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name              = string
    sku_name          = optional(string)
    sku_tier          = optional(string)
  })
}

variable "firewall_application_rules" {
  description = "Microsoft-managed virtual network that enables connectivity from other resources."
  type = list(object({
    name             = string
    description      = optional(string)
    action           = string
    source_addresses = optional(list(string))
    source_ip_groups = optional(list(string))
    fqdn_tags        = optional(list(string))
    target_fqdns     = optional(list(string))
    protocol = optional(object({
      type = string
      port = string
    }))
  }))
  default = []
}

variable "firewall_network_rules" {
  description = "List of network rules to apply to firewall."
  type = list(object({
    name                  = string
    description           = optional(string)
    action                = string
    source_addresses      = optional(list(string))
    destination_ports     = list(string)
    destination_addresses = optional(list(string))
    destination_fqdns     = optional(list(string))
    protocols             = list(string)
  }))
  default = []
}

variable "firewall_nat_rules" {
  description = "List of nat rules to apply to firewall."
  type = list(object({
    name                  = string
    description           = optional(string)
    action                = string
    source_addresses      = optional(list(string))
    destination_ports     = list(string)
    destination_addresses = list(string)
    protocols             = list(string)
    translated_address    = string
    translated_port       = string
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}