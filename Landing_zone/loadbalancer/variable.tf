variable "lbs" {
  description = "List containing your load balancers."
  type        = any
}

variable "prefix" {
  description = "Prefix applied on the load balancer resources names."
  type        = any
}

variable "location" {
  description = "Location of the load balancer, use the RG's location if not set"
  type        = any
}

variable "sku" {
  description = "SKU of the load balancer."
  type        = any
}

variable "tags" {
  description = "tags for loadbalancer"
  type        = any
}
