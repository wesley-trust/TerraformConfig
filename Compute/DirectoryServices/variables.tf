# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "DirectoryServices"
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

variable "resource_location" {
  description = "Desired location to provision the resources"
  type        = string
  default     = "UK South"
}

variable "resource_environment" {
  description = "Desired environment prefix for the provisioned resources"
  type        = string
  default     = "P"
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "ACD"
}

variable "resource_size" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "ACD"
}
