# Provision public IP for load balancer
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.resource_name}-ip"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  availability_zone   = var.resource_location_zone_support == true ? "Zone-Redundant" : "No-Zone"
  domain_name_label   = local.resource_public_ip_domain_name_label
}

# Create load balancer
resource "azurerm_lb" "load_balancer" {
  name                = "${var.resource_name}-lb"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = azurerm_public_ip.public_ip.name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

# Provision backend pool for load balancer
resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = var.resource_name
}

# Provision addresses within backend pool
resource "azurerm_lb_backend_address_pool_address" "backend_address_pool_address" {
  count                   = var.resource_instance_count
  name                    = "${var.resource_name}${format("%02d", count.index + 1)}-vm"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool.id
  virtual_network_id      = var.resource_virtual_network_id
  ip_address              = cidrhost(var.resource_address_space, 4 + count.index)
}

# Create NAT rule
resource "azurerm_lb_nat_rule" "remote_desktop_gateway" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "RemoteDesktopGateway"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = azurerm_public_ip.public_ip.name
}
