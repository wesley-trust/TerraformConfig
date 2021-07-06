# Create network adapter
resource "azurerm_network_interface" "network_interface" {
  # Lookup instance count based upon service environment
  count = var.resource_instance_count
  # Use local variable concatenation, format with a leading zero and the iteration count incremented by 1
  name                = "${local.resource_name}${format("%02d", count.index + 1)}-ni"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "virtual_machine" {
  # Lookup instance count based upon service environment
  count = var.resource_instance_count
  # Use local variable concatenation, format with a leading zero and the iteration count incremented by 1
  name                = "${local.resource_name}${format("%02d", count.index + 1)}-vm"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = var.resource_instance_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  license_type        = "Windows_Server"
  network_interface_ids = [
    # Get all of the interface ids, and select the correct one for this iteration
    element(azurerm_network_interface.network_interface.*.id, count.index),
  ]
  # Lookup the number of availability zones from a lookup of the resource location, from a lookup of the service environment
  zone = count.index + 1 % lookup(var.resource_location_az, var.service_location, null)

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.resource_disk_size
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = var.resource_vm_sku
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  tags = {
    environment = var.service_environment
  }

}
