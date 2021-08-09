output "public_ip_id" {
  value = module.public_load_balancer[0].public_ip_id
}

output "virtual_machine_id" {
  value = azurerm_windows_virtual_machine.virtual_machine[*].id
}