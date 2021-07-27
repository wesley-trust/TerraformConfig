# Calculate local variables
locals {

  # Concatenate, lookup the name based upon the lookup of the environment, location and service
  service_location_prefix       = replace(var.service_location, "/[a-z[:space:]]/", "")
  service_environment_prefix    = substr(var.service_environment, 0, 1)
  resource_group_name           = "${var.service_name}-${var.service_environment}-${local.service_location_prefix}-${var.service_deployment}-rg"
  resource_name                 = "${local.service_environment_prefix}-${local.service_location_prefix}-${var.resource_name}"
  resource_location_az_count    = lookup(var.resource_location_az, var.service_location, null)
  platform_fault_domain_count   = lookup(var.resource_location_fault_domain, var.service_location, null)
  resource_cidrsubnet           = cidrsubnets(var.resource_address_space, 1)
  resource_virtual_network_name = "${var.service_name}-${var.service_environment}-vnet"
  resource_route_table_name     = "${var.resource_subnet_name}Subnet-rt"
}
