# Create spoke network dependencies
module "service_spoke_network" {
  source                 = "../Network/"
  service_environment    = var.service_environment
  service_name           = var.service_name
  service_location       = var.service_location
  service_deployment     = var.service_deployment
  resource_address_space = var.resource_address_space
  resource_dns_servers   = var.resource_dns_servers
}