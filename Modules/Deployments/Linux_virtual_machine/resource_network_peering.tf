# Create spoke network dependencies
/* module "service_network_peering" {
  source                   = "../../Resources/Network_peering"
  service_name             = var.service_name
  resource_group_name      = module.resource_group.name
  resource_network_id      = module.service_network.network_id
  service_destination_name = var.service_destination_name
} */