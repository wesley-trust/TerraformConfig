output "public_ip_id" {
  value = module.public_load_balancer[0].public_ip_id
}