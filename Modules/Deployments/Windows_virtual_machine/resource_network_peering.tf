/* # Create local peering
module "service_network_peering" {
  source   = "../../Resources/Network_peering"
  for_each = var.resource_network_peering != null ? var.resource_network_peering : {}

  # Hub
  service_name          = var.service_name
  resource_group_name   = module.resource_group.name
  resource_network_id   = module.service_network.network_id
  resource_network_name = module.service_network.network_name

  # Peer
  resource_group_name_peer   = each.key
  resource_network_name_peer = each.value
}

# Create global peering
module "service_network_peering_global" {
  source   = "../../Resources/Network_peering"
  for_each = var.resource_network_peering_global != null ? var.resource_network_peering_global : {}

  # Hub
  service_name          = var.service_name
  resource_group_name   = module.resource_group.name
  resource_network_id   = module.service_network.network_id
  resource_network_name = module.service_network.network_name

  # Peer
  resource_group_name_peer   = each.key
  resource_network_name_peer = each.value
}

# Create standalone global peering for hub
module "service_network_peering_hub_global" {
  source   = "../../Resources/Network_peering"
  for_each = var.resource_network_hub_peering_global != null ? var.resource_network_hub_peering_global : {}

  # Hub
  service_name                                = var.service_name
  resource_group_name                         = module.resource_group.name
  resource_network_id                         = module.service_network.network_id
  resource_network_name                       = module.service_network.network_name
  resource_virtual_network_standalone_peering = true

  # Hub peer
  resource_group_name_peer   = each.key
  resource_network_name_peer = each.value
}
 */