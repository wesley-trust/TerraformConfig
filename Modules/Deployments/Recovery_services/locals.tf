# Calculate local variables
locals {

  # Service functions and concatenations
  service_environment_prefix = substr(var.service_environment, 0, 1)
  service_location_prefix    = replace(var.service_location, "/[a-z[:space:]]/", "")

  # Resource functions and concatenations
  resource_name = "${local.service_environment_prefix}-${local.service_location_prefix}-${var.resource_name}"
}
