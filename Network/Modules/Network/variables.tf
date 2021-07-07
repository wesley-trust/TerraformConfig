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

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = string
}

variable "resource_subnet_count" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
}

variable "resource_subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
}

variable "service_location" {
  description = "Desired location to provision the resources"
  type        = string
}
