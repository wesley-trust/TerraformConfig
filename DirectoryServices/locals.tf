# Calculate local variables
locals {
  # Resource
  resource_name = lookup(var.resource_name, var.service_name, null)

  # Prod Specific
  resource_prod_locations      = lookup(var.service_location, "Prod", null)
  resource_prod_instance_size  = lookup(lookup(var.resource_instance_size, "Prod", null), var.service_name, null)
  resource_prod_instance_count = lookup(lookup(var.resource_instance_count, "Prod", null), var.service_name, null)

  # Prod DR Specific
  resource_prod_dr_locations      = lookup(var.service_location, "Prod-DR", null)
  resource_prod_dr_instance_size  = lookup(lookup(var.resource_instance_size, "Prod-DR", null), var.service_name, null)
  resource_prod_dr_instance_count = lookup(lookup(var.resource_instance_count, "Prod-DR", null), var.service_name, null)
}
