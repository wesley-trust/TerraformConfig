# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "FileServices"
}

variable "service_location" {
  description = "The production resource locations to deploy"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Dev = [
      "UK South"
    ]

    BCDR = [
      "North Central US"
    ]
  }
}

variable "service_recovery_services_location" {
  description = "The resource locations to backup"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Dev = [
      "UK South"
    ]

    BCDR = [
    ]
  }
}

variable "service_storage_sync_location" {
  description = "The resource locations for storage sync"
  type        = map(any)
  default = {
    Prod = [
      "UK South"
    ]

    Dev = [
      "UK South"
    ]

    BCDR = [
    ]
  }
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "FileServices" = "FS"
  }
}

variable "resource_instance_count" {
  description = "Desired number of the provisioned resources for each service environment"
  type        = map(any)
  default = {
    Prod = {
      "FileServices" = 1
    },

    Dev = {
      "FileServices" = 1
    },

    BCDR = {
      "FileServices" = 1
    }
  }
}

variable "resource_recovery_services_instance_count" {
  description = "Desired number of the provisioned resources to backup in each service environment"
  type        = map(any)
  default = {
    Prod = {
      "FileServices" = 1
    },

    Dev = {
      "FileServices" = 1
    },

    BCDR = {
      "FileServices" = 0
    }
  }
}

variable "resource_instance_size" {
  description = "Desired size for the provisioned resources for each service"
  type        = map(any)
  default = {
    Prod = {
      "FileServices" = "Standard_B1s"
    },

    Dev = {
      "FileServices" = "Standard_B1s"
    },

    BCDR = {
      "FileServices" = "Standard_B1s"
    }
  }
}

variable "resource_data_disk_count" {
  description = "Desired size for the provisioned resources for each service"
  type        = number
  default     = 1
}

variable "resource_data_disk_size" {
  description = "Desired disk size for the provisioned data disk resources"
  type        = number
  default     = 32
}

variable "resource_address_space" {
  description = "Desired address space for the provisioned resources"
  type        = map(string)
  default = {
    "UK South"         = "10.0.4.0/24"
    "North Europe"     = "10.2.4.0/24"
    "West Europe"      = "10.4.4.0/24"
    "North Central US" = "10.6.4.0/24"
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

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
  default     = "spoke"
}

variable "resource_network_peer_role" {
  description = "The network type for peering"
  type        = string
  default     = "hub"
}