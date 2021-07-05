# Create virtual machine
module "virtual_machine_prod" {
  source      = ".\\Modules\\Compute_az"
  name        = var.service_name
  environment = var.service_environment
  deployment  = var.service_deployment
}
