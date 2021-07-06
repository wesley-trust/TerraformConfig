# Get subnet information
data "azurerm_subnet" "subnet" {
  name                 = var.resource_subnet_name
  virtual_network_name = local.virtual_network_name
  resource_group_name  = local.network_resource_group_name
}
