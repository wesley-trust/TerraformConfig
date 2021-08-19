module "directory_services_prod" {
  for_each                = toset(local.resource_prod_locations)
  source                  = "../Modules/Deployments/Windows_virtual_machine"
  service_environment     = "Prod"
  service_deployment      = "01"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_prod_instance_count
  resource_instance_size  = local.resource_prod_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = var.resource_network_role
}

module "directory_services_network_peering_prod" {
  for_each                   = toset(local.resource_prod_locations)
  source                     = "../Modules/Deployments/Network_peering"
  service_environment        = "Prod"
  service_deployment         = "01"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.directory_services_prod[each.value]
  resource_network_peer_role = var.resource_network_peer_role
}

module "directory_services_recovery_services_prod" {
  depends_on                                  = [module.directory_services_prod]
  for_each                                    = toset(local.resource_prod_recovery_services_locations)
  source                                      = "../Modules/Deployments/Recovery_services"
  service_environment                         = "Prod"
  service_deployment                          = "01"
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_prod_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.directory_services_prod[each.value]
}

module "directory_services_prod_dr" {
  for_each                = toset(local.resource_prod_dr_locations)
  source                  = "../Modules/Deployments/Windows_virtual_machine"
  service_environment     = "Prod"
  service_deployment      = "01"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_prod_dr_instance_count
  resource_instance_size  = local.resource_prod_dr_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers    = lookup(var.resource_dns_servers, each.value, null)
  resource_network_role   = var.resource_network_role
}

module "directory_services_network_peering_prod_dr" {
  for_each                   = toset(local.resource_prod_dr_locations)
  source                     = "../Modules/Deployments/Network_peering"
  service_environment        = "Prod"
  service_deployment         = "01"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.directory_services_prod_dr[each.value]
  resource_network_peer_role = var.resource_network_peer_role
}