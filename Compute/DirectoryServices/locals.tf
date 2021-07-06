# Calculate local variables
locals {
  # Concatenate, lookup the name based upon the lookup of the environment, location and service
  resource_prod_locations    = lookup(var.resource_location, "Prod", null)
  resource_name              = lookup(var.resource_name, var.service_name, null)
  resource_instance_count    = lookup(var.resource_instance_count, "Prod", null)
  resource_instance_size     = lookup(var.resource_instance_size, var.service_name, null)
  resource_network_name      = lookup(var.resource_network_name, var.service_name, null)
  resource_subnet_name       = lookup(var.resource_subnet_name, var.service_name, null)
  resource_prod-dr_locations = lookup(var.resource_location, "Prod-DR", null)
}
