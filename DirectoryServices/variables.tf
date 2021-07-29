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
    "UK South"         = "10.0.0.0/24"
    "North Europe"     = "10.0.2.0/24"
    "West Europe"      = "10.0.4.0/24"
    "North Central US" = "10.0.6.0/24"
  }
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = map(any)
  default = {
    "UK South" = [
      "10.0.0.4",
      "10.0.0.5"
    ]

    "North Europe" = [
      "10.0.2.4",
      "10.0.2.5"
    ]

    "West Europe" = [
      "10.0.4.4",
      "10.0.4.5"
    ]

    "North Central US" = [
      "10.0.6.4",
      "10.0.6.5"
    ]
  }
}
