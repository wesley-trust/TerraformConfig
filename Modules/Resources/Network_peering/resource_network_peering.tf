resource "azurerm_virtual_network_peering" "from_service_to_peer" {
  name                = "From-${var.service_name}-To-${resource_network_name_peer}"
  resource_group_name = var.resource_group_name
  # Source
  virtual_network_name = var.resource_network_name
  # Destination
  remote_virtual_network_id = data.azurerm_virtual_network.peer.id
}

resource "azurerm_virtual_network_peering" "to_service_from_peer" {
  name                = "To-${var.service_name}-From-${resource_network_name_peer}"
  resource_group_name = var.resource_network_name_peer
  # Source
  virtual_network_name = data.azurerm_virtual_network.peer.name
  # Destination
  remote_virtual_network_id = var.resource_network_id
}