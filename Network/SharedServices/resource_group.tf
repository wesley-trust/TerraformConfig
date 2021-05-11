# Define resource group for resource
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_name}-${var.resource_environment}-rg"
  location = var.resource_location
}