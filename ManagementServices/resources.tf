module "management_services_prod" {
  for_each                       = toset(local.resource_prod_locations)
  source                         = "../Modules/Deployments/Windows_virtual_machine"
  service_environment            = "Prod"
  service_deployment             = "01"
  service_name                   = var.service_name
  service_location               = each.value
  resource_name                  = local.resource_name
  resource_instance_count        = local.resource_prod_instance_count
  resource_instance_size         = local.resource_prod_instance_size
  resource_address_space         = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers           = lookup(var.resource_dns_servers, each.value, null)
  provision_public_load_balancer = var.provision_public_load_balancer
}

module "management_services_traffic_manager_prod" {
  count                                       = var.provision_traffic_manager == true ? 1 : 0
  source                                      = "../Modules/Deployments/Traffic_manager"
  service_environment                         = "Prod"
  service_deployment                          = "01"
  service_name                                = "${var.service_name}-TM"
  service_location                            = local.resource_prod_traffic_manager_location
  resource_name                               = local.resource_name
  resource_traffic_manager_endpoints          = module.management_services_prod
  resource_traffic_manager_endpoint_locations = local.resource_prod_locations
}

module "management_services_recovery_services_prod" {
  for_each                                    = toset(local.resource_prod_recovery_services_locations)
  source                                      = "../Modules/Deployments/Recovery_services"
  service_environment                         = "Prod"
  service_deployment                          = "01"
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_prod_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.management_services_prod[each.value]
}