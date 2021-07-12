# Define virtual network
resource "azurerm_virtual_network" "virtual_network" {
  name                = local.resource_virtual_network_name
  address_space       = ["${var.resource_address_space}"]
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}

resource "azurerm_subnet" "subnet" {
  for_each             = toset(local.resource_cidrsubnets)
  name                 = "${var.resource_subnet_name}Subnet-${index(local.resource_cidrsubnets, each.value) + 1}"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [each.value]
}

resource "azurerm_route_table" "route_table" {
  name                          = local.resource_route_table_name
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
  for_each       = azurerm_subnet.subnet
  subnet_id      = each.value.id
  route_table_id = azurerm_route_table.route_table.id
}