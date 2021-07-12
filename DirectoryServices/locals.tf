# Calculate local variables
locals {
  # Resource
  resource_name          = lookup(var.resource_name, var.service_name, null)
  resource_instance_size = lookup(var.resource_instance_size, var.service_name, null)
  resource_address_space = lookup(var.resource_address_space, each.value, null)
  resource_subnet_name   = lookup(var.resource_subnet_name, each.value, null)

  # Production Specific
  resource_prod_locations      = lookup(var.service_location, "Prod", null)
  resource_prod_instance_count = lookup(var.resource_instance_count, "Prod", null)

  # Production DR Specific
  resource_prod_dr_locations      = lookup(var.service_location, "Prod-DR", null)
  resource_prod_dr_instance_count = lookup(var.resource_instance_count, "Prod-DR", null)
}
