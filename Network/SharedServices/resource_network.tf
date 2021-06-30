# Define virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = "${var.resource_name}-${var.service_environment}-vnet"
  address_space       = ["${var.resource_address_space}"]
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

resource "azurerm_subnet" "subnet" {
  for_each             = toset(var.subnet_prefix)
  name                 = "Subnet-${index(var.subnet_prefix, each.value) + 1}"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [each.value]
}

resource "azurerm_route_table" "route_table" {
  name                          = "${var.subnet_name}Subnet-rt"
  resource_group_name           = azurerm_resource_group.resource_group.name
  location                      = azurerm_resource_group.resource_group.location
  disable_bgp_route_propagation = false
  route {
    name           = "UDR-Internet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
}

resource "azurerm_subnet_route_table_association" "association" {
  for_each       = toset(azurerm_subnet.subnet.name)
  subnet_id      = azurerm_subnet.subnet[each.key].id
  route_table_id = azurerm_route_table.route_table.id
}
