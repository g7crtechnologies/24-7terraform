variable "env" {
  description = "Environment"
  type        = any
  default     = null
}

variable "region" {
  description = "region for resources"
  type        = string
  default     = "eu"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = null
}

variable "location" {
  description = "location of rg"
  type        = string
  default     = "eastus"
}
