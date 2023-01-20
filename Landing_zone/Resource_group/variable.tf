variable "env" {
  description = "Environment"
  type = any
}

variable "region" {
  description = "region for resources"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "location of rg"
  type        = string
  default     = ""
}
