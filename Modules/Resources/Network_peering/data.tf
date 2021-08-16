data "azurerm_virtual_network" "peer" {
  name                = var.resource_network_name_peer
  resource_group_name = var.resource_group_name_peer
}