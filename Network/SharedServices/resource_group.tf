# Define resource group for resource
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.service_name}-${var.service_environment}-${var.service_deployment}-rg"
  location = var.resource_location
}
