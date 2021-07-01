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

variable "resource_vm_size" {
  description = "Desired size for the provisioned resources"
  type        = string
  default     = "Standard_B1s"
}

variable "resource_vm_sku" {
  description = "Desired size for the provisioned resources"
  type        = string
  default     = "2019-Datacenter-smalldisk"
}

variable "resource_disk_size" {
  description = "Desired size for the provisioned resources"
  type        = string
  default     = "32"
}

variable "resource_network_group" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
  default     = "SharedServices-Prod-01-rg"
}

variable "resource_network_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
  default     = "SharedServices-Prod-vnet"
}

variable "resource_subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = string
  default     = "InfrastructureSubnet-1"
}