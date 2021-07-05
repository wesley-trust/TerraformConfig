# Create production virtual machine
module "virtual_machine_prod" {
  source              = "../Modules/Compute_az"
  service_name        = var.service_name
  service_environment = "Prod"
  service_deployment  = var.service_deployment
}

# Create virtual machine
module "virtual_machine_prod_dr" {
  source              = "../Modules/Compute_az"
  service_name        = var.service_name
  service_environment = "Prod-DR"
  service_deployment  = var.service_deployment
}