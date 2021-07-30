# Create spoke network dependencies
module "data_disks" {
  count                       = var.resource_instance_count
  source                      = "../Disks/"
  service_environment         = var.service_environment
  service_name                = var.service_name
  service_location            = var.service_location
  service_deployment          = var.service_deployment
  resource_name               = "${local.resource_name}${format("%02d", count.index + 1)}-vm"
  resource_zone               = local.platform_location_az_count > 1 ? (count.index % local.platform_location_az_count) + 1 : null
  resource_data_disk_count    = var.resource_data_disk_count
  resource_data_disk_size     = var.resource_data_disk_size
  resource_virtual_machine_id = element(azurerm_windows_virtual_machine.virtual_machine.*.id, count.index)
}