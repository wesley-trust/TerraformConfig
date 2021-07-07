# Create production virtual machines
module "network_prod" {
  for_each               = toset(local.resource_prod_locations)
  service_environment    = "Prod"
  source                 = "../Modules/Network"
  service_name           = var.service_name
  service_location       = each.value
  service_deployment     = format("%02d", index(local.resource_prod_locations, each.value) + 1)
  resource_address_space = lookup(var.resource_address_space, each.value, null)
  resource_subnet_name   = lookup(var.resource_subnet_name, each.value, null)
}

module "network_prod_dr" {
  for_each               = toset(local.resource_prod_dr_locations)
  service_environment    = "Prod-DR"
  source                 = "../Modules/Network"
  service_name           = var.service_name
  service_location       = each.value
  service_deployment     = format("%02d", index(local.resource_prod_dr_locations, each.value) + 1)
  resource_address_space = lookup(var.resource_address_space, each.value, null)
  resource_subnet_name   = lookup(var.resource_subnet_name, each.value, null)
}
