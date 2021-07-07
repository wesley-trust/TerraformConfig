# Calculate local variables
locals {
  # Resource
  resource_cidrsubnet = "local.resource_cidrsubnets.${var.resource_subnet_count}"
  resource_cidrsubnets = {
    "1" = cidrsubnets(var.resource_address_space, 1)
    "2" = cidrsubnets(var.resource_address_space, 1, 1)
  }
  resource_group_name           = "${var.service_name}-${var.service_environment}-${var.service_deployment}-rg"
  resource_virtual_network_name = "${var.service_name}-${var.service_environment}-vnet"
  resource_route_table_name     = "${var.resource_subnet_name}Subnet-rt"
}
