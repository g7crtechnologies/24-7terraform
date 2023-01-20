
variable "location" {
  type        = string
  description = "Location of Resources"
}

variable "account_tier" {
  type        = string
  description = "Account tier for storage account"
}

variable "account_replication_type" {
  type        = string
  description = "Account replication type for storage account"
}

variable "container_access_type" {
  type        = string
  description = "Access type for storage account Container"
}

variable "tags" {
  type        = map(string)
  description = "Tags for every resources"
}

variable "env" {
  description = "Environment"
  type        = any
}
