variable "parent_management_group_name" {
  type    = string
  default = null
}

variable "display_name" {
  type    = string
  default = ""
}

variable "secrets_name" {
  type    = string
  default = null
}

variable "key_vault_name" {
  type    = string
  default = ""
}

variable "key_vault_rg_name" {
  type    = string
  default = ""
}

variable "parent_management_group_id" {
  type    = string
  default = ""
}

variable "subscription_enable" {
  type    = string
  default = true
}

variable "pid" {
  type    = bool
  default = true
}

variable "remote_state" {
  type = string
  default = null
}