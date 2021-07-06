# Calculate local variables
locals {
  # Concatenate, lookup the name based upon the lookup of the environment, location and service
  resource_name = "${lookup(var.resource_environment_prefix, var.service_environment, null)}-${lookup(var.resource_location_prefix, lookup(var.resource_location, var.service_environment, null), null)}-${lookup(var.resource_name, var.service_name, null)}"
}