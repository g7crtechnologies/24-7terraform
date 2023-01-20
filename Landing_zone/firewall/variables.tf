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

variable "virtual_network_name" {
  description = "Name of your Azure Virtual Network"
  default     = ""
}

variable "firewall_subnet_address_prefix" {
  description = "The address prefix to use for the Firewall subnet.The Subnet used for the Firewall must have the name AzureFirewallSubnet and the subnet mask must be at least a /26."
  default     = []
}

variable "firewall_management_subnet_address_prefix" {
  description = "The address prefix to use for Firewall managemement subnet to enable forced tunnelling. The Management Subnet used for the Firewall must have the name `AzureFirewallManagementSubnet` and the subnet mask must be at least a `/26`."
  default     = null
}

variable "public_ip_prefix_length" {
  description = "Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses)."
  default     = 31
}

variable "public_ip_names" {
  description = "Public ips is a list of ip names that are connected to the firewall. At least one is required."
  type        = list(string)
  default     = ["fw-public"]
}

variable "firewall_service_endpoints" {
  description = "Service endpoints to add to the firewall subnet"
  type        = list(string)
  default = [
    "Microsoft.AzureActiveDirectory",
    "Microsoft.AzureCosmosDB",
    "Microsoft.EventHub",
    "Microsoft.KeyVault",
    "Microsoft.ServiceBus",
    "Microsoft.Sql",
    "Microsoft.Storage",
  ]
}

variable "firewall_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name              = string
    sku_name          = optional(string)
    sku_tier          = optional(string)
  })
}

variable "enable_forced_tunneling" {
  description = "Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet"
  default     = false
}


variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}