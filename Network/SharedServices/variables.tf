# Define variables
variable "service_name" {
  description = "Desired name for the service collection of provisioned resources"
  type        = string
  default     = "SharedServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South",
    ]

    Prod-DR = [
      "North Europe",
    ]
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"     = "10.0.0.0/23"
    "North Europe" = "10.1.0.0/23"
  }
}

variable "resource_subnet_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(string)
  default = {
    "Prod"    = 2
    "Prod-DR" = 1
  }
}

variable "resource_subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"     = "Infrastructure"
    "North Europe" = "Infrastructure"
  }
}
