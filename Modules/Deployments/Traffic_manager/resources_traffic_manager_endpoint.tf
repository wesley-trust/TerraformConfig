# Create traffic manager endpoint
resource "azurerm_traffic_manager_endpoint" "traffic_manager_endpoint" {
  for_each            = toset(var.resource_traffic_manager_endpoint_locations)
  name                = "${local.service_environment_prefix}-${replace(each.value, "/[a-z[:space:]]/", "")}-${var.service_deployment}-${var.resource_name}"
  resource_group_name = module.resource_group.name
  profile_name        = azurerm_traffic_manager_profile.traffic_manager_profile.name
  target_resource_id  = var.resource_traffic_manager_endpoints[each.value].public_ip_id
  type                = "azureEndpoints"
  weight              = 100
}
