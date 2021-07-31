# Create network interfaces
module "network_interfaces" {

  # Force explicit dependency to prevent race condition/deadlock in network module
  depends_on = [
    module.service_spoke_network
  ]
  count                            = var.resource_instance_count
  source                           = "../Network_interfaces/"
  resource_location                = module.resource_group.location
  resource_group_name              = module.resource_group.name
  resource_environment             = var.service_environment
  resource_name                    = "${local.resource_name}${format("%02d", count.index + 1)}-vm"
  resource_network_interface_count = var.resource_network_interface_count
  resource_subnet_id               = module.service_spoke_network.subnet_ids
  resource_private_ip_address      = cidrhost(var.resource_address_space, 4 + count.index)
}
