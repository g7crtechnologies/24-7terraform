# List of load balancer.

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

# Prefix for Load balancer

variable "prefix" {
  description = "Prefix applied on the load balancer resources names."
  type        = any
  default     = "tfs-ilb"
}

#Location of the load balancer 

variable "location" {
  description = "Location of the load balancer, use the RG's location if not set"
  type        = any
  default     = "eastus"
}

#SKU of the load balancer

variable "sku" {
  description = "SKU of the load balancer."
  type        = any
  default     = "Standard"
}

# Tags for Azure resources

variable "tags" {
  description = "tags for loadbalancer"
  type        = any
  default     = null
}
