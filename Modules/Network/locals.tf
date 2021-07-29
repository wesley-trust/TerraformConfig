# Calculate local variables
locals {

  # Service functions and concatenations
  service_location_prefix = replace(var.service_location, "/[a-z[:space:]]/", "")

  # Resource functions and concatenations
  resource_cidrsubnet                  = cidrsubnets(var.resource_address_space, 1)
  resource_group_name                  = "${var.service_name}-${var.service_environment}-${local.service_location_prefix}-${var.service_deployment}-rg"
  resource_virtual_network_name        = "${var.service_name}-${var.service_environment}-vnet"
  resource_subnet_name                 = "${var.service_name}Subnet"
  resource_route_table_name            = "${local.resource_subnet_name}-rt"
  resource_network_security_group_name = "${local.resource_subnet_name}-nsg"
}
