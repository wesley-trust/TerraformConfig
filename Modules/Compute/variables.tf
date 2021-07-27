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
variable "resource_address_space" {
  description = "Required deployment identifier of the network"
  type        = string
}

variable "resource_subnet_name" {
  description = "The subnet name for the provisioned resources"
  type        = string
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = string
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = string
}

# Defined resource variables
variable "resource_location_fault_domain" {
  description = "Number of fault domains in the location"
  type        = map(string)
  default = {
    "UK West"          = 2
    "North Europe"     = 2
    "West Europe"      = 2
    "North Central US" = 2
  }
}

variable "resource_location_az" {
  description = "Number of availability zones in the location"
  type        = map(string)
  default = {
    "UK South"         = 3
    "UK West"          = 0
    "North Europe"     = 3
    "West Europe"      = 3
    "North Central US" = 0
  }
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

variable "admin_username" {
  description = "Desired username for the provisioned resources"
  type        = string
  default     = "wesley"
}

variable "admin_password" {
  description = "Desired password for the provisioned resources"
  type        = string
  default     = "mnUuk2TOEVe1qh"
  sensitive   = true
}
