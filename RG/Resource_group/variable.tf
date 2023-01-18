variable "env" {
  description = "Environment"
  type = any
#   type = object({
#     stb  = string
#     stg  = string
#     dev  = string
#     qa   = string
#     prod = string
#     psr  = string
#   })
}

variable "component" {
  description = "Prefix for each-resource"
  type = any
#   object({
#     stb  = string
#     stg  = string
#     dev  = string
#     qa   = string
#     prod = string
#     psr  = string
#   })
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
