variable "parent_management_group_name" {
  type    = string
  default = null
}

variable "display_name" {
  type    = string
  default = "hub"
}

variable "secrets_name" {
  type    = string
  default = "sub-hub"
}

variable "key_vault_name" {
  type    = string
  default = "managementgroup1"
}

variable "key_vault_rg_name" {
  type    = string
  default = "management_group"
}

variable "parent_management_group_id" {
  type    = string
  default = ""
}

variable "subscription_enable" {
  type    = string
  default = ""
}
variable "pid" {
  type    = bool
  default = true
}

variable "remote_state" {
  type = string
  
}