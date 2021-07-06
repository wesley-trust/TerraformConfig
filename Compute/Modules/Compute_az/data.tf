# Get subnet information
data "azurerm_subnet" "subnet" {
  name                 = lookup(var.resource_subnet_name, var.service_name, null)
  virtual_network_name = "${lookup(var.resource_network_name, var.service_name, null)}-${var.service_environment}-vnet"
  resource_group_name  = "${lookup(var.resource_network_name, var.service_name, null)}-${var.service_environment}-${var.service_deployment}-rg"
}
