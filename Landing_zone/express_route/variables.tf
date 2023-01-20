variable "location" {
  description = "location of express route"
  type = string
}

variable "pip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = "Standard"
}

variable "authorization_name" {
  type    = string
  default = "auth_name"
}

variable "er_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name                     = string
    service_provider_name    = string
    peering_location         = string
    bandwidth_in_mbps        = number
    allow_classic_operations = optional(bool)
  })
  default = {
    bandwidth_in_mbps        = 1
    name                     = "er_gatway"
    peering_location         = "Silicon Valley"
    service_provider_name    = "AT&T Netbond"
    allow_classic_operations = false
  }
}

variable "sku" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    tier   = string
    family = string
  })
  default = {
    family = "MeteredData"
    tier   = "Standard"
  }
}

variable "vng_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name          = string
    type          = string
    sku           = string
    active_active = optional(bool)
  })
  default = {
    name          = "vpn_gateway"
    sku           = "HighPerformance"
    type          = "ExpressRoute"
    active_active = false
  }
}

variable "con_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name              = string
    type              = string
    authorization_key = string
  })
  default = {
    authorization_key = "XJbFYyIQQD56H8mgAtl"
    name              = "connections_gw"
    type              = "ExpressRoute"
  }
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
