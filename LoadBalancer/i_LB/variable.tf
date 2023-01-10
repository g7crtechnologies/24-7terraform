variable "Lbs" {
  description = "List containing your load balancers."
  type        = any
}

variable "LbRules" {
  description = "List containing your load balancers parameters."
  type        = any
}
variable "prefix" {
  type        = string
  description = "Prefix applied on the load balancer resources names."
}

variable "location" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name of the load balancer."
}

variable "sku" {
  type        = string
  description = "SKU of the load balancer."
}

variable "subnet_name" {
  type        = any
  description = "Subnet list"
}
