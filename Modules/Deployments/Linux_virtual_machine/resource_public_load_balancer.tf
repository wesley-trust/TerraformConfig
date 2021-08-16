# Create public load balancer
module "public_load_balancer" {
  depends_on                     = [azurerm_linux_virtual_machine.virtual_machine]
  count                          = var.provision_public_load_balancer == true ? 1 : 0
  source                         = "../../Resources/Public_load_balancer"
  resource_location              = module.resource_group.location
  resource_group_name            = module.resource_group.name
  resource_environment           = var.service_environment
  resource_name                  = local.resource_name
  resource_instance_count        = var.resource_instance_count
  resource_location_zone_support = local.platform_location_az_count > 1 ? true : false
  resource_virtual_network_id    = module.service_network.network_id
  resource_address_space         = var.resource_address_space
}
