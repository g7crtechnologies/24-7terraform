variable "key_vault_name" {
  type        = string
  default     = "tfs-kv-hub-speech"
  description = "name of key vault"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = null
}

variable "sku_name" {
  description = "key vault sku"
  type        = string
  default     = "standard"
}

variable "key_per" {
  description = "key permission on key vault"
  type        = list(string)
  default     = ["Get"]
}

variable "secret_per" {
  description = "secrets permission on key vault"
  type        = list(string)
  default     = ["Get"]
}

variable "storage_per" {
  description = "storage permission on key vault"
  type        = list(string)
  default     = ["Get"]
}
