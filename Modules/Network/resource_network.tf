# Define virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = local.resource_virtual_network_name
  address_space       = ["${var.resource_address_space}"]
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  dns_servers         = var.resource_dns_servers
}

resource "azurerm_subnet" "subnet" {
  name                 = local.resource_subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = local.resource_cidrsubnet
}

resource "azurerm_route_table" "route_table" {
  name                          = local.resource_route_table_name
  resource_group_name           = azurerm_resource_group.resource_group.name
  location                      = azurerm_resource_group.resource_group.location
  disable_bgp_route_propagation = false
}

resource "azurerm_route" "udr_internet" {
  resource_group_name = azurerm_resource_group.resource_group.name
  route_table_name    = azurerm_route_table.route_table.name
  name                = "UDR-Internet"
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

resource "azurerm_subnet_route_table_association" "subnet_association" {
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = azurerm_route_table.route_table.id
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = local.resource_network_security_group_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

resource "azurerm_subnet_network_security_group_association" "network_security_group_association" {
  # Explicit dependency to prevent race condition of the route table being associated in parallel
  depends_on = [
    azurerm_subnet_route_table_association.subnet_association
  ]
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}