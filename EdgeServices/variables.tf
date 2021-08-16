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
      "North Central US"
    ]
  }
}

variable "service_recovery_services_location" {
  description = "The production resource locations to backup"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Prod-DR = [
    ]
  }
}

variable "resource_network_peering" {
  description = "The resources resource group and network pairs"
  type        = map(any)
  default = {
    "Prod" = {
      "DirectoryServices-Prod-UKS-01-rg" = "DirectoryServices-Prod-vnet"
    },
    "Prod-DR" = {

    }
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "EdgeServices" = "FW"
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    "Prod" = {
      "EdgeServices" = 2
    },
    "Prod-DR" = {
      "EdgeServices" = 1
    }
  }
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = map(any)
  default = {
    "Prod" = {
      "EdgeServices" = 1
    },
    "Prod-DR" = {
      "EdgeServices" = 0
    }
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    "Prod" = {
      "EdgeServices" = "Standard_B1ls"
    },
    "Prod-DR" = {
      "EdgeServices" = "Standard_B1ls"
    }
  }
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.0.0/23"
    "North Europe"     = "10.2.0.0/23"
    "West Europe"      = "10.4.0.0/23"
    "North Central US" = "10.6.0.0/23"
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

variable "resource_network_interface_count" {
  description = "Desired number of network interfaces"
  type        = string
  default     = 2
}
