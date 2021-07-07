# Calculate local variables
locals {

  # Production Specific
  resource_prod_locations    = lookup(var.service_location, "Prod", null)
  resource_prod_subnet_count = lookup(var.resource_subnet_count, "Prod", null)

  # Production DR Specific
  resource_prod_dr_locations    = lookup(var.service_location, "Prod-DR", null)
  resource_prod_dr_subnet_count = lookup(var.resource_subnet_count, "Prod-DR", null)
}
