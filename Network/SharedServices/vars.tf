variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "SharedServices"
}

variable "resource_address_space" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "10.0.0.0/24"
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
  default    = "Prod"
}

variable "resource_subnet_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "Infrastructure"
}

variable "resource_subnet_prefix" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "10.0.0.0/24"
}

variable "resource_location" {
  description = "Desired location to provision the resources. Eg UK South"
  type        = string
  default    = "UK South"
}