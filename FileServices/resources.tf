module "file_services_prod" {
  for_each                 = toset(local.resource_prod_locations)
  source                   = "../Modules/Deployments/Windows_virtual_machine"
  service_environment      = "Prod"
  service_deployment       = "01"
  service_name             = var.service_name
  service_location         = each.value
  resource_name            = local.resource_name
  resource_instance_count  = local.resource_prod_instance_count
  resource_instance_size   = local.resource_prod_instance_size
  resource_data_disk_count = var.resource_data_disk_count
  resource_data_disk_size  = var.resource_data_disk_size
  resource_address_space   = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers     = lookup(var.resource_dns_servers, each.value, null)
    resource_network_type   = var.resource_network_type
}

/* module "file_services_network_peering_prod" {
  depends_on                 = [module.directory_services_prod]
  for_each                   = toset(local.resource_prod_locations)
  source                     = "../Modules/Deployments/Network_peering"
  service_environment        = "Prod"
  service_deployment         = "01"
  service_name               = var.service_name
  service_location           = each.value
  resource_network_peer      = module.edge_services_prod[each.value]
  resource_network_peer_type = var.resource_network_peer_type
} */

module "file_services_storage_sync_prod" {
  for_each            = toset(local.resource_prod_storage_sync_locations)
  source              = "../Modules/Deployments/Storage_sync"
  service_environment = "Prod"
  service_deployment  = "01"
  service_name        = "${var.service_name}-SS"
  service_location    = each.value
  resource_name       = local.resource_name
}

module "file_services_recovery_services_prod" {
  depends_on                                  = [module.file_services_prod]
  for_each                                    = toset(local.resource_prod_recovery_services_locations)
  source                                      = "../Modules/Deployments/Recovery_services"
  service_environment                         = "Prod"
  service_deployment                          = "01"
  service_name                                = "${var.service_name}-RSV"
  service_location                            = each.value
  resource_name                               = local.resource_name
  resource_recovery_services_instance_count   = local.resource_prod_recovery_services_instance_count
  resource_recovery_services_virtual_machines = module.file_services_prod[each.value]
}

module "file_services_prod_dr" {
  for_each                 = toset(local.resource_prod_dr_locations)
  source                   = "../Modules/Deployments/Windows_virtual_machine"
  service_environment      = "Prod-DR"
  service_deployment       = "01"
  service_name             = var.service_name
  service_location         = each.value
  resource_name            = local.resource_name
  resource_instance_count  = local.resource_prod_dr_instance_count
  resource_instance_size   = local.resource_prod_dr_instance_size
  resource_data_disk_count = var.resource_data_disk_count
  resource_data_disk_size  = var.resource_data_disk_size
  resource_address_space   = lookup(var.resource_address_space, each.value, null)
  resource_dns_servers     = lookup(var.resource_dns_servers, each.value, null)
    resource_network_type   = var.resource_network_type
}