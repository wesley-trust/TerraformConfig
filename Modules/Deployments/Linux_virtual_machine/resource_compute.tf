# Create availability set
resource "azurerm_availability_set" "availability_set" {

  # If there is less than one availability zone, create availability set
  count = local.platform_location_az_count < 1 ? 1 : 0

  # Format with leading zero
  name                        = "${local.resource_name}-as"
  location                    = module.resource_group.location
  resource_group_name         = module.resource_group.name
  platform_fault_domain_count = local.platform_fault_domain_count

  tags = {
    environment = var.service_environment
  }
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "virtual_machine" {
  count = var.resource_instance_count

  # Format with leading zero
  name                            = "${local.resource_name}${format("%02d", count.index + 1)}-vm"
  location                        = module.resource_group.location
  resource_group_name             = module.resource_group.name
  size                            = var.resource_instance_size
  admin_username                  = var.admin_username
  admin_password                  = random_password.password[count.index].result
  disable_password_authentication = false

  # Get all of the interface ids, and select the correct one for this iteration
  network_interface_ids = element(module.network_interfaces.*.network_interface_ids, count.index)

  # If there is less than one availability zone, then specify availability set id
  availability_set_id = local.platform_location_az_count < 1 ? azurerm_availability_set.availability_set[0].id : null

  # If there is more than one availability zone, select the AZ in iteration from the maximum count of availability zones
  zone = local.platform_location_az_count > 1 ? (count.index % local.platform_location_az_count) + 1 : null

  os_disk {
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.resource_disk_size
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  tags = {
    environment = var.service_environment
  }

}
