# Forcibly register provider as it wasn't automatically registered
/* resource "azurerm_resource_provider_registration" "storage_sync" {
  name = "Microsoft.StorageSync"
  
  lifecycle {
    prevent_destroy = true
  }
} */