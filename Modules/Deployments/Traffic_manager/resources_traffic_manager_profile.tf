# Create traffic manager profile
resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                   = local.resource_traffic_manager_profile
  resource_group_name    = module.resource_group.name
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = local.resource_traffic_manager_profile
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTPS"
    port                         = 443
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = {
    environment = var.service_environment
  }
}
