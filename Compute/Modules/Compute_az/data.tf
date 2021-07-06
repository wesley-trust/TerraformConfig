# Get subnet information
data "azurerm_subnet" "subnet" {
  name                 = var.resource_subnet_name
  virtual_network_name = "${var.resource_network_name}-${var.service_environment}-vnet"
  resource_group_name  = "${var.resource_network_name}-${var.service_environment}-${var.service_deployment}-rg"
}