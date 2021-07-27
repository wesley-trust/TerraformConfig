# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "DirectoryServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South",
    ]

    Prod-DR = [
      "North Europe"
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

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.0.0/23"
    "North Europe"     = "10.1.0.0/23"
    "West Europe"      = "10.2.0.0/23"
    "North Central US" = "10.3.0.0/23"
  }
}

variable "resource_subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "Infrastructure"
    "North Europe"     = "Infrastructure"
    "West Europe"      = "Infrastructure"
    "North Central US" = "Infrastructure"
  }
}
