# Define variables
variable "service_name" {
  description = "Desired name for the service collection of provisioned resources"
  type        = string
  default     = "SharedServices"
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
  default     = "Prod"
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "SharedServices"
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = string
  default     = "10.0.0.0/23"
}

variable "subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
  default     = "Infrastructure"
}

variable "subnet_prefix" {
  description = "Desired subnet prefixes for the provisioned resources"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "resource_location" {
  description = "Desired location to provision the resources"
  type        = string
  default     = "UK South"
}