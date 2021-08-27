# Create spoke network dependencies
module "service_network" {
  count                   = var.provision_private_link == true ? 1 : 0
  source                  = "../../Resources/Network"
  service_name            = "${var.service_name}-Private"
  service_location_prefix = local.service_location_prefix
  resource_location       = module.resource_group.location
  resource_group_name     = module.resource_group.name
  resource_environment    = var.service_environment
  resource_address_space  = var.resource_address_space
}