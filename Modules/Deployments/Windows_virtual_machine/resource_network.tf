# Create spoke network dependencies
module "service_network" {
  source                        = "../../Resources/Network"
  service_name                  = var.service_name
  service_location_prefix       = local.service_location_prefix
  resource_location             = module.resource_group.location
  resource_group_name           = module.resource_group.name
  resource_environment          = var.service_environment
  resource_address_space        = var.resource_address_space
  resource_dns_servers          = var.resource_dns_servers
  resource_network_subnet_count = var.resource_network_interface_count
  resource_network_role         = var.resource_network_role
}
