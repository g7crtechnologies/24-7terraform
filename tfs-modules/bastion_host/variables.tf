# SKU of Bastion host

variable "sku" {
  type        = string
  description = "Azure Bastion Host Service SKU"
  default     = "Basic" // Basic or Standard
}

# Number of Bastion host
variable "scale_units" {
  type        = string
  description = "Azure Bastion Host Service Scale Units"
  default     = 2 // Basic = 2 or Standard = 2 to 50
}

# azure region of Bastion host
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "north europe"
}

#Subnet CIDR for Bastion Host

variable "subnet_cidr" {
  type        = list(string)
  description = "subnet cidr bastion host"
  default     = ["10.88.58.0/26"]
}