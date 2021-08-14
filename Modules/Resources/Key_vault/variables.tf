# Required resource variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_group_name" {
  description = "Desired resource group name for the provisioned resources"
  type        = string
}

variable "resource_environment" {
  description = "Desired environment for the provisioned resources"
  type        = string
}

variable "resource_location" {
  description = "Desired location for the provisioned resources"
  type        = string
}

variable "resource_instance_count" {
  description = "Virtual network ID for the provisioned resources"
  type        = string
}

variable "resource_secret" {
  description = "Resource secret to store in vault"
  type        = any
}

variable "resource_key_vault_access_object_ids" {
  description = "The object ID to have access to the key vault"
  type        = list(string)
}