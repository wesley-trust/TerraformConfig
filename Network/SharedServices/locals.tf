# Calculate local variables
locals {
  resource_cidrsubnets = cidrsubnets(var.resource_address_space, 1, 1)
}