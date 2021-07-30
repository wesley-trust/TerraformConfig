# Define resource group for resource
resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = var.service_location
}
