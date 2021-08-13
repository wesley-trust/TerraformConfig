# Create random password
resource "random_password" "password" {
  count = var.resource_instance_count

  length  = 20
  special = true
}