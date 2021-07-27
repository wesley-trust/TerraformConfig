# Calculate local variables
locals {

  # Prod Specific
  resource_prod_locations    = lookup(var.service_location, "Prod", null)

  # Prod DR Specific
  resource_prod_dr_locations    = lookup(var.service_location, "Prod-DR", null)
}
