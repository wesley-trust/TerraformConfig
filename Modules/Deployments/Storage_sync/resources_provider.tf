# Forcibly register provider
resource "azurerm_resource_provider_registration" "storage_sync" {
  name = "Microsoft.StorageSync"
}