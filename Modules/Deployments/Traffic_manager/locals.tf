# Calculate local variables
locals {

  # Service functions and concatenations
  service_environment_prefix = substr(var.service_environment, 0, 1)

  # Resource functions and concatenations
  resource_traffic_manager_profile = lower("${local.service_environment_prefix}-${var.service_deployment}-${var.resource_name}-${data.azurerm_subscription.current.subscription_id}")
}
