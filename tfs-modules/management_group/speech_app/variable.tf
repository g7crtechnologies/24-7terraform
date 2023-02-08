# Name of parent management group id
variable "parent_management_group_name" {
  description = "Name of parent management group id"
  type        = string
  default     = null
}

#Display name of management group
variable "display_name" {
  description = "Display name of management group"
  type        = string
  default     = "hub"
}

#ID of parent management group id
variable "parent_management_group_id" {
  description = "ID of parent management group id"
  type        = string
  default     = null
}

# To enable the Subscription for management group (Default is True) 
variable "subscription_ids" {
  description = "To enable the Subscription for management group (Default is True)"
  type        = list(string)
  default     = null
}

#To take the parent ID from Remote State
variable "pid" {
  description = "To take the parent ID from the variable or Remote State (Default is True) "
  type        = bool
  default     = true
}

# Value from Remote State
variable "remote_state" {
  description = "Value from Remote State"
  type        = string
  default     = null
}
