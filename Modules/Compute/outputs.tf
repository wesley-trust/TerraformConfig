output "availability_set" {
  value = azurerm_availability_set.availability_set
}

output "network_interface" {
  value = azurerm_network_interface.network_interface
}

output "virtual_machine" {
  value = azurerm_windows_virtual_machine.virtual_machine
}
