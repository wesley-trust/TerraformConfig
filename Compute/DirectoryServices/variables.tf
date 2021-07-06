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

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South",
    ]

    Prod-DR = [
      "UK West",
    ]
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

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(string)
  default = {
    "Prod"    = 2
    "Prod-DR" = 1
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(string)
  default = {
    "DirectoryServices" = "Standard_B1s"
    "FileServices"      = "Standard_B1s"
  }
}

variable "resource_network_name" {
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
