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
variable "resource_network_peering_hub" {
    description = "Hub resource outputs for peering"
  type        = any
}