# Calculate local variables
locals {
  description          = "Calculated subnet prefixes for the provisioned resources"
  type                 = list(string)
  resource_cidrsubnets = cidrsubnets(var.resource_address_space, 1, 1)
}