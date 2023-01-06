variable "Lbs" {
  description = "List containing your load balancers."
  type        = any
}

variable "LbRules" {
  description = "List containing your load balancers parameters."
  type        = any
}
variable "prefix" {
  description = "Prefix applied on the load balancer resources names."
}

variable "location" {
  description = "Location of the load balancer, use the RG's location if not set"
  default     = ""
}

variable "resource_group_name" {
  description = "Resource group name of the load balancer."
}

variable "sku" {
  description = "SKU of the load balancer."
}

variable "subnet_name" {
  type    = any
  description = "Subnet list"
}