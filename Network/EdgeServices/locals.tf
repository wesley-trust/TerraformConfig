# Calculate local variables
locals {

  # Production Specific
  resource_prod_locations    = lookup(var.service_location, "Prod", null)

  # Production DR Specific
  resource_prod_dr_locations    = lookup(var.service_location, "Prod-DR", null)
}
