# Define variables
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

variable "resource_location_prefix" {
  description = "Desired location for each service environment"
  type        = map(string)
  default = {
    "UK South"     = "UKS"
    "UK West"      = "UKW"
    "North Europe" = "NEU"
  }
}

variable "resource_environment_prefix" {
  description = "Desired environment prefix for the provisioned resources"
  type        = map(string)
  default = {
    "Prod"    = "P"
    "Prod-DR" = "P"
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_location_fault_domain" {
  description = "Number of fault domains in the location"
  type        = map(string)
  default = {
    "UK West"      = 2
    "North Europe" = 2
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = string
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = string
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

variable "resource_network_name" {
  description = "The network name for the provisioned resources"
  type        = string
}

variable "resource_network_deployment" {
  description = "Required deployment identifier of the network"
  type        = string
}

variable "resource_subnet_name" {
  description = "The subnet name for the provisioned resources"
  type        = string
}

variable "admin_username" {
  description = "Desired username for the provisioned resources"
  type        = string
  default     = "wesley"
}

variable "admin_password" {
  description = "Desired password for the provisioned resources"
  type        = string
  default     = "CheeseCake1987"
}
