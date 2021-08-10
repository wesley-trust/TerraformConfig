# Create network adapter
resource "azurerm_network_interface" "network_interface" {
  count = var.resource_network_interface_count

  # Format with leading zero
  name                = "${var.resource_name}-ni${count.index + 1}"
  location            = var.resource_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.resource_subnet_id
    private_ip_address_allocation = "static"
    private_ip_address            = var.resource_private_ip_address
  }
}
