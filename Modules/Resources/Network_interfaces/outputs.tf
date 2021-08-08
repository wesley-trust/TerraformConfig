# Outputs for use by other modules
output "network_interface_ids" {
  value = azurerm_network_interface.network_interface.*.id
}