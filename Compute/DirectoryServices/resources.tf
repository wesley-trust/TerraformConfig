# Create virtual machine
module "virtual_machine_prod" {
  source              = "./Modules/Compute_az/"
  service_name        = var.service_name
  service_environment = var.service_environment
  service_deployment  = var.service_deployment
}
