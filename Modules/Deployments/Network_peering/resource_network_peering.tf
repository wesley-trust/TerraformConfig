resource "azurerm_virtual_network_peering" "network_peering" {
  count = length(data.azurerm_resources.virtual_network_spokes.resources)

  name = "From-${var.resource_network_peer.network_name}-To-${data.azurerm_resources.virtual_network_spokes.resources[count.index].name}"

  # Hub
  resource_group_name  = var.resource_network_peer.resource_group_name
  virtual_network_name = var.resource_network_peer.network_name

  # Peer
  remote_virtual_network_id = data.azurerm_resources.virtual_network_spokes.resources[count.index].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # Required to be false for global peering
  allow_gateway_transit = false
}
