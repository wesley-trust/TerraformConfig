resource "azurerm_network_interface" "network_interface" {
  name                = "${var.resource_environment}-WMG01-ni"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "${var.resource_environment}-WMG01-nic"
    subnet_id                     = azurerm_subnet.SUBNET-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                = "${var.resource_environment}-WMG01"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = var.resource_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "127"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storageaccount.primary_blob_endpoint
  }

}