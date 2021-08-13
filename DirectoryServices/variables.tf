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
      "UK South"
    ]

    Prod-DR = [
      "North Central US"
    ]
  }
}

variable "service_recovery_services_location" {
  description = "The production resource locations to backup"
  type        = map(any)
  default = {
    Prod = [
    ]

    Prod-DR = [
    ]
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "DirectoryServices" = "ACD"
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    "Prod" = {
      "DirectoryServices" = 2
    },
    "Prod-DR" = {
      "DirectoryServices" = 1
    }
  }
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = map(any)
  default = {
    "Prod" = {
      "DirectoryServices" = 0
    },
    "Prod-DR" = {
      "DirectoryServices" = 0
    }
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    "Prod" = {
      "DirectoryServices" = "Standard_B1s"
    },
    "Prod-DR" = {
      "DirectoryServices" = "Standard_B1s"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.2.0/24"
    "North Europe"     = "10.2.2.0/24"
    "West Europe"      = "10.4.2.0/24"
    "North Central US" = "10.6.2.0/24"
  }
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = map(any)
  default = {
    "UK South" = [
      "10.0.2.4",
      "10.0.2.5"
    ]

    "North Europe" = [
      "10.2.2.4",
      "10.2.2.5"
    ]

    "West Europe" = [
      "10.4.2.4",
      "10.4.2.5"
    ]

    "North Central US" = [
      "10.6.2.4",
      "10.6.2.5"
    ]
  }
}