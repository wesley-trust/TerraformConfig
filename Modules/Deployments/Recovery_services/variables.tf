# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
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
  description = "Desired location for each service environment"
  type        = string
}

# Required resource variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = string
}

variable "resource_recovery_services_virtual_machines" {
  description = "Desired virtual machines of the provisioned resources to backup"
  type        = any
}
