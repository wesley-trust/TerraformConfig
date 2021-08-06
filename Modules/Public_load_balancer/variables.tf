# Required resource variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_group_name" {
  description = "Desired resource group name for the provisioned resources"
  type        = string
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
}

variable "resource_location" {
  description = "Desired location for the provisioned resources"
  type        = string
}

variable "resource_virtual_network_id" {
  description = "Virtual network ID for the provisioned resources"
  type        = string
}

variable "resource_address_space" {
  description = "Virtual network address space for the provisioned resources"
  type        = string
}

variable "resource_instance_count" {
  description = "Virtual network ID for the provisioned resources"
  type        = string
}
variable "resource_location_zone_support" {
  description = "Whether the current location supports zones"
  type        = bool
}