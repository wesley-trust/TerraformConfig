# Define variables
variable "service_name" {
  description = "Desired name for the service collection of provisioned resources"
  type        = string
  default     = "EdgeServices"
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
    "UK South"     = "10.0.10.0/23"
    "North Europe" = "10.1.10.0/23"
  }
}

variable "resource_subnet_name" {
  description = "Desired subnet name for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"     = "Private"
    "North Europe" = "Private"
  }
}
