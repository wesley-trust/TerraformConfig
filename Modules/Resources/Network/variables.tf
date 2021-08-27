# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "service_location_prefix" {
  description = "Location prefix to append to names to create regionally unique resources"
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

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = list(string)
  default     = null
}

variable "resource_network_subnet_count" {
  description = "Desired number of subnets for the provisioned resources"
  type        = string
  default     = 1

  validation {
    condition     = var.resource_network_subnet_count <= 2
    error_message = "The maximum subnet count cannot exceed 2, due to a (currently hard coded) limitation in the current configuration."
  }
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = null
}
