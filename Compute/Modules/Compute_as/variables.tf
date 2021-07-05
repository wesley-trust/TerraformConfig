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

variable "resource_location" {
  description = "Desired location for each service environment"
  type        = map(string)
  default = {
    "Prod"    = "UK South"
    "Prod-DR" = "UK West"
  }
}

variable "resource_location_prefix" {
  description = "Desired location for each service environment"
  type        = map(string)
  default = {
    "UK South" = "UKS"
    "UK West"  = "UKW"
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
  type        = map(string)
  default = {
    "DirectoryServices" = "ACD"
    "FileServices"      = "FS"
  }
}

variable "resource_location_fault_domain" {
  description = "Number of fault domains in the location"
  type        = map(string)
  default = {
    "UK West" = "2"
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(string)
  default = {
    "Prod"    = 2
    "Prod-DR" = 1
  }
}

variable "resource_vm_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(string)
  default = {
    "DirectoryServices" = "Standard_B1s"
    "FileServices"      = "Standard_B1s"
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

variable "resource_network" {
  description = "The network name for the provisioned resources"
  type        = map(string)
  default = {
    "DirectoryServices" = "SharedServices"
    "FileServices"      = "SharedServices"
  }
}

variable "resource_subnet_name" {
  description = "The subnet name for the provisioned resources"
  type        = map(string)
  default = {
    "DirectoryServices" = "InfrastructureSubnet-1"
    "FileServices"      = "InfrastructureSubnet-1"
  }
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
