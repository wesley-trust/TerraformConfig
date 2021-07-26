# Calculate local variables
locals {

  # Concatenate, lookup the name based upon the lookup of the environment, location and service
  resource_group_name           = "${var.service_name}-${var.service_environment}-${var.service_deployment}-rg"
  resource_name                 = "${lookup(var.resource_environment_prefix, var.service_environment, null)}-${lookup(var.resource_location_prefix, var.service_location, null)}-${var.resource_name}"
  resource_location_az_count    = lookup(var.resource_location_az, var.service_location, null)
  platform_fault_domain_count   = lookup(var.resource_location_fault_domain, var.service_location, null)
  resource_cidrsubnet           = cidrsubnets(var.resource_address_space, 1)
  resource_virtual_network_name = "${var.service_name}-${var.service_environment}-vnet"
  resource_route_table_name     = "${var.resource_subnet_name}Subnet-rt"
}
