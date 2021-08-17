# Calculate local variables
locals {

  # Resource functions and concatenations
  resource_cidrsubnet                  = var.resource_network_subnet_count == 1 ? cidrsubnets(var.resource_address_space, 1) : cidrsubnets(var.resource_address_space, 1, 1)
  resource_virtual_network_name        = "${var.service_name}-${var.resource_environment}-${var.service_location_prefix}-vnet"
  resource_subnet_name                 = "${var.service_name}Subnet"
  resource_route_table_name            = "${local.resource_subnet_name}-rt"
  resource_network_security_group_name = "${local.resource_subnet_name}-nsg"
}
