# Create static site
resource "azurerm_static_site" "wesleytrust-com" {
  name                = local.resource_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
}
