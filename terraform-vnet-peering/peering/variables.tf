variable "rg_sub_source" {
  type        = string
  default     = "Data"
  description = "Name of the resource group."
}

variable "vnet_name_sub_source" {
  type        = string
  default     = "Demo"
  description = "Name of Virtual Network"
}

variable "rg_sub_destination" {
  type        = string
  default     = "RG-Anshu-01"
  description = "Name of the resource group."
}

variable "vnet_name_sub_destination" {
  type        = string
  default     = "Demo"
  description = "Name of Virtual Network"
}

variable "peering_name_source" {
  type        = string
  default     = "source_to_destination"
  description = "name of  peering in  subscription a"
}

variable "peering_name_destination" {
  type        = string
  default     = "destination_to_source"
  description = "name of  peering in subscription b"
}
