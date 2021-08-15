# Calculate local variables
locals {
  # Service functions and concatenations
  service_environment_prefix = substr(var.service_environment, 0, 1)
  service_location_prefix    = replace(var.service_location, "/[a-z[:space:]]/", "")

  # Resource functions and concatenations
  resource_name                             = "${local.service_environment_prefix}-${local.service_location_prefix}-${var.resource_name}"
  resource_storage_account_name             = lower("${var.service_name}${var.service_environment}sa${random_id.id.hex}")
  resource_storage_share_name               = lower("${local.resource_name}-share")
  resource_storage_sync_name                = "${local.resource_name}-ss"
  resource_storage_sync_group_name          = "${local.resource_storage_sync_name}-gp"
  resource_storage_sync_cloud_endpoint_name = "${local.resource_storage_sync_name}-ce"
}
