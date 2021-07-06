# Create production virtual machines
module "virtual_machine_prod" {
  service_environment     = "Prod"
  for_each                = toset(local.resource_prod_locations)
  source                  = lookup(var.source_compute, lookup(var.availability_location_support, each.value, null), null)
  service_name            = var.service_name
  service_location        = each.value
  service_deployment      = format("%02d", index(local.resource_prod_locations, each.value) + 1)
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_network_name   = local.resource_network_name
  resource_subnet_name    = local.resource_subnet_name
}

module "virtual_machine_prod_dr" {
  service_environment     = "Prod-DR"
  for_each                = toset(local.resource_prod_locations)
  source                  = lookup(var.source_compute, lookup(var.availability_location_support, each.value, null), null)
  service_name            = var.service_name
  service_location        = each.value
  service_deployment      = format("%02d", index(local.resource_prod_dr_locations, each.value) + 1)
  resource_name           = local.resource_name
  resource_instance_count = local.resource_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_network_name   = local.resource_network_name
  resource_subnet_name    = local.resource_subnet_name
}