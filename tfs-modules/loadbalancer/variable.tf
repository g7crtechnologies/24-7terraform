variable "lbs" {
  description = "List containing your load balancers."
  type        = any
  default = {
    prod = {
      prod-c2c = {
        name        = "prod-c2c"
        description = "aiva"
      }
      prod-cde = {
        name        = "prod-cde"
        description = "aiva"
      }
      prod-oos = {
        name        = "prod-oos"
        description = "aiva"
      }
    }
  }
}
variable "prefix" {
  description = "Prefix applied on the load balancer resources names."
  type        = any
  default     = "tfs-ilb"
}

variable "location" {
  description = "Location of the load balancer, use the RG's location if not set"
  type        = any
  default     = "eastus"
}

variable "sku" {
  description = "SKU of the load balancer."
  type        = any
  default     = "Standard"
}

variable "tags" {
  description = "tags for loadbalancer"
  type        = any
  default     = null
}
