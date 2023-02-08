# Environment
variable "env" {
  description = "Environment"
  type        = any
  default     = null
}

# Region for all azure resources
variable "region" {
  description = "region for resources"
  type        = string
  default     = "eu"
}

#Tags for Azure Resources
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = null
}

# Resource group Location
variable "location" {
  description = "location of rg"
  type        = string
  default     = "eastus"
}
