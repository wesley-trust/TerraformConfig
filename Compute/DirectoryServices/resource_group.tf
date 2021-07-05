# Define resource group for resource
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.service_name}-${var.service_environment}-rg"
  location = lookup(var.resource_location, var.service_environment, null)
}