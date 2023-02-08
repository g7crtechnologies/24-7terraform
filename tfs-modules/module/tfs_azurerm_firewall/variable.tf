# Region for Azure firewall
variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus"
}

# List of Public ips.
variable "public_ip_names" {
  description = "Public ips is a list of ip names that are connected to the firewall. At least one is required."
  type        = list(string)
  default     = ["fw-public"]
}

# Azure Firewall configuration
variable "firewall_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name              = string
    sku_name          = optional(string)
    sku_tier          = optional(string)
  })
  default = {
    name     = "hub"
    sku_name = "AZFW_VNet"
    sku_tier = "Standard"
  }
}

# Variable to Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet

variable "enable_forced_tunneling" {
  description = "Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet"
  default     = false
}

# Tags for azure resources.
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = null
}

# Azure firewall subnet
variable "firewall_subnet" {
  description = "azure firewall subnet"
  type = list(string)
  default = ["10.88.48.0/26"]
}