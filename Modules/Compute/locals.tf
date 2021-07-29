# Calculate local variables
locals {

  # Platform functions and concatenations
  platform_location_az_count  = lookup(var.platform_location_az, var.service_location, null)
  platform_fault_domain_count = lookup(var.platform_location_fault_domain, var.service_location, null)

  # Service functions and concatenations
  service_location_prefix    = replace(var.service_location, "/[a-z[:space:]]/", "")
  service_environment_prefix = substr(var.service_environment, 0, 1)

  # Resource functions and concatenations
  resource_group_name                  = "${var.service_name}-${var.service_environment}-${local.service_location_prefix}-${var.service_deployment}-rg"
  resource_name                        = "${local.service_environment_prefix}-${local.service_location_prefix}-${var.resource_name}"
  resource_virtual_network_name        = "${var.service_name}-${var.service_environment}-vnet"
  resource_subnet_name                 = "${var.service_name}Subnet"
  resource_route_table_name            = "${local.resource_subnet_name}-rt"
  resource_network_security_group_name = "${local.resource_subnet_name}-nsg"
}
