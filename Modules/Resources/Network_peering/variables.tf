# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

# Required resource variables
variable "resource_group_name" {
  description = "Desired resource group name for the provisioned resources"
  type        = string
}

variable "resource_network_id" {
  description = "The network Id"
  type        = string
}

variable "resource_network_name" {
  description = "The network name"
  type        = string
}

variable "resource_group_name_peer" {
  description = "The resource group name of the peer"
  type        = string
}

variable "resource_network_name_peer" {
  description = "The network name of the peer"
  type        = string
}

variable "resource_virtual_network_standalone_peering" {
  description = "Whether the network peering type is 'hub'"
  type        = bool
  default     = false
}
