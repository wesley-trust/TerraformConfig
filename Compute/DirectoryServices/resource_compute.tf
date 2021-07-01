# Get subnet information
data "azurerm_subnet" "subnet" {
  name                 = var.resource_subnet_name
  virtual_network_name = var.resource_network_name
  resource_group_name  = var.resource_network_group
}

# Create network adapter
resource "azurerm_network_interface" "network_interface" {
  count               = var.resource_vm_instance_count
  name                = "${var.resource_environment}-${var.resource_name}${count.index + 1}-ni"
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
  count               = var.resource_vm_instance_count
  name                = "${var.resource_environment}-${var.resource_name}${count.index + 1}-vm"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = var.resource_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  license_type        = "Windows_Server"
  network_interface_ids = [
    element(azurerm_network_interface.vm.*.id, count.index),
  ]

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
