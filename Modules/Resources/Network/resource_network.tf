# Define virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = local.resource_virtual_network_name
  address_space       = ["${var.resource_address_space}"]
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  dns_servers         = var.resource_dns_servers

  tags = {
    environment = var.resource_environment
    role        = var.resource_network_role
  }
}

resource "azurerm_subnet" "subnet" {
  count                                          = var.resource_network_subnet_count
  name                                           = "${local.resource_subnet_name}-${count.index + 1}"
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.virtual_network.name
  address_prefixes                               = [local.resource_cidrsubnet[count.index]]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true
}

resource "azurerm_route_table" "route_table" {
  count                         = var.resource_network_subnet_count
  name                          = "${local.resource_route_table_name}${count.index + 1}"
  location                      = var.resource_location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false
}

resource "azurerm_route" "udr_internet" {
  count               = var.resource_network_subnet_count
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table[count.index].name
  name                = "UDR-Internet"
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

resource "azurerm_subnet_route_table_association" "subnet_association" {
  count          = var.resource_network_subnet_count
  subnet_id      = azurerm_subnet.subnet[count.index].id
  route_table_id = azurerm_route_table.route_table[count.index].id
}

resource "azurerm_network_security_group" "network_security_group" {
  count               = var.resource_network_subnet_count
  name                = "${local.resource_network_security_group_name}${count.index + 1}"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "network_security_group_association" {
  count                     = var.resource_network_subnet_count
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.network_security_group[count.index].id
}
