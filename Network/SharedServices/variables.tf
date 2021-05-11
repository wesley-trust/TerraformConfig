# Define variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "SharedServices"
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = string
  default    = "10.0.0.0/24"
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
  default    = "Prod"
}

variable "subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
  default    = "Infrastructure"
}

variable "subnet_prefix" {
  description = "Desired subnet prefix for the provisioned resources"
  type        = string
  default    = "10.0.0.0/24"
}

variable "resource_location" {
  description = "Desired location to provision the resources"
  type        = string
  default    = "UK South"
}