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
variable "resource_data_disk_count" {
  description = "Desired number of data disks"
  type        = string
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
}

variable "resource_zone" {
  description = "Desired zone for the provisioned resources"
  type        = string
}

variable "resource_virtual_machine_id" {
  description = "Resource virtual machine id"
  type        = string
}

# Defined resource variables
variable "resource_data_disk_size" {
  description = "Desired size for the provisioned resources"
  type        = string
  default     = "32"
}

variable "resource_disk_size" {
  description = "Desired disk size for the provisioned resources"
  type        = string
  default     = "32"
}