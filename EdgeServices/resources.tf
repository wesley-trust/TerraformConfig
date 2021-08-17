module "edge_services_prod" {
  for_each                         = toset(local.resource_prod_locations)
  source                           = "../Modules/Deployments/Linux_virtual_machine"
  service_environment              = "Prod"
  service_deployment               = "01"
  service_name                     = var.service_name
  service_location                 = each.value
  resource_name                    = local.resource_name
  resource_instance_count          = local.resource_prod_instance_count
  resource_instance_size           = local.resource_prod_instance_size
  resource_network_interface_count = var.resource_network_interface_count
  resource_address_space           = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers             = lookup(var.resource_dns_servers, each.value, null)
  #resource_network_peering         = local.resource_prod_network_peering
  #resource_network_peering_global  = local.resource_prod_dr_network_peering
}

module "edge_services_recovery_services_prod" {
  depends_on                                  = [module.edge_services_prod]
  for_each                                    = toset(local.resource_prod_recovery_services_locations)
  source                                      = "../Modules/Deployments/Recovery_services"
  service_environment                         = "Prod"
  service_deployment                          = "01"
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_prod_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.edge_services_prod[each.value]
}

module "edge_services_prod_dr" {
  for_each                         = toset(local.resource_prod_dr_locations)
  source                           = "../Modules/Deployments/Linux_virtual_machine"
  service_environment              = "Prod-DR"
  service_deployment               = "01"
  service_name                     = var.service_name
  service_location                 = each.value
  resource_name                    = local.resource_name
  resource_instance_count          = local.resource_prod_dr_instance_count
  resource_instance_size           = local.resource_prod_dr_instance_size
  resource_network_interface_count = var.resource_network_interface_count
  resource_address_space           = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers             = lookup(var.resource_dns_servers, each.value, null)
  #resource_network_peering         = local.resource_prod_dr_network_peering
  #resource_network_peering_global  = local.resource_prod_network_peering
}
