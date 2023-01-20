
variable "location" {
  type = string
  description = "Location of each resources"
}

variable "account_tier" {
  type = string
  description = "account tier of storage account"
}

variable "account_replication_type" {
  type = string
  description = "account replication type of storage account"
}

variable "container_access_type" {
  type = string
  description = "access type of storage account container"
}

variable "tags" {
  type = map(string)
  description = "LocTagsation of each resources"
}

variable "env" {
  description = "Environment"
  type        = any
}
