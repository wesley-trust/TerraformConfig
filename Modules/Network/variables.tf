# Define variables
variable "service_name" {
  description = "Desired name for the service collection of provisioned resources"
  type        = string
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
}

variable "service_location" {
  description = "Desired location to provision the resources"
  type        = string
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = string
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = list(string)
}