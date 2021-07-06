# Calculate local variables
locals {
  # Concatenate, lookup the name based upon the lookup of the environment, location and service
  resource_group_name         = "${var.service_name}-${var.service_environment}-${var.service_deployment}-rg"
  resource_name               = "${lookup(var.resource_environment_prefix, var.service_environment, null)}-${lookup(var.resource_location_prefix, var.service_location, null)}-${var.resource_name}"
  platform_fault_domain_count = lookup(var.resource_location_fault_domain, var.service_location, null)
  virtual_network_name        = "${var.resource_network_name}-${var.service_environment}-vnet"
  network_resource_group_name = "${var.resource_network_name}-${var.service_environment}-${var.resource_network_deployment}-rg"
}
