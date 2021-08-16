# Outputs for use by other modules
output "subnet_id" {
  value = azurerm_subnet.subnet[*].id
}

output "subnet_address_prefixes" {
  value = azurerm_subnet.subnet[*].address_prefixes
}

output "network_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "network_name" {
  value = azurerm_virtual_network.virtual_network.name
}