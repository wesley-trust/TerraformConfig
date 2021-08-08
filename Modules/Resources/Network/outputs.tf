# Outputs for use by other modules
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
output "network_id" {
  value = azurerm_virtual_network.virtual_network.id
}