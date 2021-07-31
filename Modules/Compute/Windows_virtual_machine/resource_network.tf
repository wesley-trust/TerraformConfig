# Create spoke network dependencies
module "service_spoke_network" {
  source                 = "../../Network/"
  service_name           = var.service_name
  resource_location      = module.resource_group.location
  resource_group_name    = module.resource_group.name
  resource_environment   = var.service_environment
  resource_address_space = var.resource_address_space
  resource_dns_servers   = var.resource_dns_servers
}
