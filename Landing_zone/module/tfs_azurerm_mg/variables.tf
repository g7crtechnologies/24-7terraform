variable "parent_management_group_name" {
  description = "Name of parent management group id"
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name of management group"
  type        = string
  default     = "hub"
}

variable "secrets_name" {
  description = "Secret name in Key Vault"
  type        = string
  default     = "hub"
}

variable "key_vault_name" {
  description = "Name of Key Vault"
  type        = string
  default     = "tfs-kv-hub-eu-speech"
}

variable "key_vault_rg_name" {
  description = "Resource group name of Key Vault"
  type        = string
  default     = "tfs-rg-hub-eu-speech"
}

variable "parent_management_group_id" {
  description = "ID of parent management group id"
  type        = string
  default     = null
}

variable "subscription_enable" {
  description = "To enable the Subscription for management group (Default is True)"
  type        = string
  default     = true
}
variable "pid" {
  description = "To take the parent ID from the variable or Remote State (Default is True) "
  type        = bool
  default     = true
}

variable "remote_state" {
  description = "Value from Remote State"
  type        = string
  default     = null
}
