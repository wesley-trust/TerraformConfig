# Required resource variables
variable "resource_network_interface_count" {
  description = "Desired number of network interfaces"
  type        = string
}

variable "resource_subnet_id" {
  description = "Desired subnet id"
  type        = list(string)
}

variable "resource_subnet_address_prefixes" {
  description = "Subnet address prefix"
  type        = any
}

variable "resource_private_ip_initial_address" {
  description = "The initial IP address available for static assignment"
  type        = string
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_group_name" {
  description = "Desired resource group name for the provisioned resources"
  type        = string
}

variable "resource_location" {
  description = "Desired location for the provisioned resources"
  type        = string
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
}
