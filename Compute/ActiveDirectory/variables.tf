# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default    = "DirectoryServices"
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
  default    = "Prod"
}

variable "resource_location" {
  description = "Desired location to provision the resources"
  type        = string
  default    = "UK South"
}