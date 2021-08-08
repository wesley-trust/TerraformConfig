# Calculate local variables
locals {

  # Resource functions and concatenations
  resource_public_ip_domain_name_label = lower("${var.resource_name}-${data.azurerm_subscription.current.subscription_id}")
}
