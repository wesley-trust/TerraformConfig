# Create production virtual machines
module "virtual_machine_prod" {
  for_each                = toset(local.resource_prod_locations)
  source                  = "../Modules/Compute"
  service_environment     = "Prod"
  service_deployment      = "01"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_prod_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_subnet_name    = lookup(var.resource_subnet_name, each.value, null)
}

module "virtual_machine_prod_dr" {
  for_each                = toset(local.resource_prod_dr_locations)
  source                  = "../Modules/Compute"
  service_environment     = "Prod-DR"
  service_deployment      = "01"
  service_name            = var.service_name
  service_location        = each.value
  resource_name           = local.resource_name
  resource_instance_count = local.resource_prod_dr_instance_count
  resource_instance_size  = local.resource_instance_size
  resource_address_space  = lookup(var.resource_address_space, each.value, null)
  resource_subnet_name    = lookup(var.resource_subnet_name, each.value, null)
}
