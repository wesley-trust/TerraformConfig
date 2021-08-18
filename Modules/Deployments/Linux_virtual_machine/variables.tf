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
  description = "Required address space of the network"
  type        = string
}

variable "resource_dns_servers" {
  description = "Desired DNS servers for the provisioned resources"
  type        = list(any)
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
variable "platform_location_fault_domain" {
  description = "Number of fault domains in the location"
  type        = map(string)
  default = {
    "UK West"          = 2
    "North Europe"     = 2
    "West Europe"      = 2
    "North Central US" = 2
  }
}

variable "platform_location_az" {
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

variable "resource_data_disk_count" {
  description = "Desired size for the provisioned resources for each service"
  type        = number
  default     = 0
}

variable "resource_data_disk_size" {
  description = "Desired disk size for the provisioned data disk resources"
  type        = number
  default     = 0
}

variable "resource_disk_size" {
  description = "Desired disk size for the provisioned resources"
  type        = string
  default     = "32"
}

variable "resource_network_interface_count" {
  description = "Desired number of network interfaces"
  type        = string
  default     = 1
}

variable "admin_username" {
  description = "Desired username for the provisioned resources"
  type        = string
  default     = "wesley"
}

variable "provision_public_load_balancer" {
  description = "Whether to provision a public load balancer"
  type        = bool
  default     = false
}

variable "provision_key_vault" {
  description = "Whether to provision a key vault"
  type        = bool
  default     = true
}

variable "resource_key_vault_access_object_ids" {
  description = "The object IDs to have access to the key vault"
  type        = list(string)
  default = [
    "27cf12d2-6428-4882-a6ff-ca3cf4aef391"
  ]
}

variable "resource_traffic_manager_profile_name" {
  description = "Traffic manager profile name"
  type        = string
  default     = null
}

variable "resource_traffic_manager_resource_group_name" {
  description = "Traffic manager resource group name"
  type        = string
  default     = null
}

variable "resource_private_ip_initial_address" {
  description = "The initial IP address available for static assignment"
  type        = string
  default     = 4
}

variable "resource_network_role" {
  description = "The network type for peering"
  type        = string
}