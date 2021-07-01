# Get subnet information
data "azurerm_subnet" "subnet" {
  name                 = var.resource_subnet_name
  virtual_network_name = var.resource_network_name
  resource_group_name  = var.resource_network_group
}