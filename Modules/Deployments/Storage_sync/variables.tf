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

variable "resource_storage_sync_object_id" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "a7ddc9cc-daee-4e0a-be3f-027903915879"
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = string
  default     = "172.30.16.0/24"
}

variable "provision_private_link" {
  description = "Whether to provision a private link"
  type        = bool
  default     = false
}
