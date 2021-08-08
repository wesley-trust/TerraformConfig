# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

# Required resource variables
variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
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

# Defined resource variables
variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = list(string)
}