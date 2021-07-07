# Create production virtual machines
module "network_prod" {
  for_each              = toset(local.resource_prod_locations)
  service_environment   = "Prod"
  source                = "../Modules/Network"
  service_name          = var.service_name
  service_location      = each.value
  service_deployment    = format("%02d", index(local.resource_prod_locations, each.value) + 1)
  resource_subnet_count = local.resource_prod_subnet_count
  resource_subnet_name  = local.resource_subnet_name
}

module "network_prod_dr" {
  for_each              = toset(local.resource_prod_dr_locations)
  service_environment   = "Prod-DR"
  source                = "../Modules/Network"
  service_name          = var.service_name
  service_location      = each.value
  service_deployment    = format("%02d", index(local.resource_prod_dr_locations, each.value) + 1)
  resource_subnet_count = local.resource_prod_dr_subnet_count
  resource_subnet_name  = local.resource_subnet_name
}
