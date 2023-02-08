# Environment
variable "env" {
  description = "Environment"
  type        = any
  default     = "hub"
}

# Region for resources
variable "region" {
  description = "region for resources"
  type        = string
  default     = "eu"
}

# Tags for all azure resources
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = null
}

# Location of Resource group
variable "location" {
  description = "location of rg"
  type        = string
  default     = "eastus"
}
