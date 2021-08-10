output "public_ip_id" {
  value = try(module.public_load_balancer[0].public_ip_id, null)
}

output "virtual_machine_id" {
  value = azurerm_linux_virtual_machine.virtual_machine[*].id
}
