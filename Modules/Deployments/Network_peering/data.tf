# Get virtual network resources
data "azurerm_resources" "virtual_network_spokes" {
  type = "Microsoft.Network/virtualNetworks"

  required_tags = {
    environment = "Prod"
    role        = "hub"
  }
}
