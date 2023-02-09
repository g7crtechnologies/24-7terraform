variable "resource_group_name" {
  type        = string
  description = "(Required): Name of the resource group where resources should be deployed."
}

variable "private_dns_zone_name" {
  type        = string
  description = "Pvt dns zone name"
}
variable "location" {
  type        = string
  description = "(Required): Region / Location where Azure DNS Resolver should be deployed"
}

variable "dns_resolver_name" {
  type        = string
  description = "(Required): Name of the Azure DNS Private Resolver"
}


variable "dns_resolver_inbound_endpoints" {
  description = "(Optional): Set of Azure Private DNS resolver Inbound Endpoints"
  type = set(object({
    inbound_endpoint_name = string
  }))
  default = []
}

variable "dns_resolver_outbound_endpoints" {
  description = "(Optional): Set of Azure Private DNS resolver Outbound Endpoints with one or more Forwarding Rule sets"
  type = set(object({
    outbound_endpoint_name = string
    forwarding_rulesets = optional(set(object({
      forwarding_ruleset_name = optional(string)
    })))
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional): Resource Tags"
  default     = {}
}

variable "virtual_network_name" {
  type        = string
  default     = "dns-resolver"
  description = "Virtual Network Name"
}

variable "virtual_network_address_space" {
  type        = list(string)
  default     = ["10.1.0.0/23"]
  description = "List of all virtual network addresses"
}

variable "inbound_subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.1.0.0/24"]
  description = "List of inbound subnet address prefixes"
}

variable "outbound_subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.1.1.0/24"]
  description = "List of outbound subnet address prefixes"
}

variable "subnet_name1" {
  type = string
  default = "subnet1"
}

variable "subnet_name2" {
  type = string
  default = "subnet2"
}