resource "azurerm_virtual_network_peering" "from_hub_to_peer" {
  name                = "From-${var.resource_network_name}-To-${var.resource_network_name_peer}"
  resource_group_name = var.resource_group_name
  # From
  virtual_network_name = var.resource_network_name
  # To
  remote_virtual_network_id = data.azurerm_virtual_network.peer.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  allow_gateway_transit = false
}

resource "azurerm_virtual_network_peering" "from_peer_to_hub" {
  name                = "From-${var.resource_network_name_peer}-To-${var.resource_network_name}"
  resource_group_name = var.resource_group_name_peer
  # From
  virtual_network_name = data.azurerm_virtual_network.peer.name
  # To
  remote_virtual_network_id = var.resource_network_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  allow_gateway_transit = false
}
