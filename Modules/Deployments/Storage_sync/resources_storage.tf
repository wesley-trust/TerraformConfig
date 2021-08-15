resource "azurerm_storage_sync" "sync" {
  depends_on          = [azurerm_resource_provider_registration.storage_sync]
  name                = local.resource_storage_sync_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

resource "azurerm_storage_sync_group" "sync_group" {
  name            = local.resource_storage_sync_group_name
  storage_sync_id = azurerm_storage_sync.sync.id
}

resource "azurerm_storage_account" "account" {
  name                     = local.resource_storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_share" "share" {
  name                 = local.resource_storage_share_name
  storage_account_name = azurerm_storage_account.account.name

  acl {
    id = "GhostedRecall"
    access_policy {
      permissions = "r"
    }
  }
}

resource "azurerm_storage_sync_cloud_endpoint" "sync_cloud_endpoint" {
  name                  = local.resource_storage_sync_cloud_endpoint_name
  storage_sync_group_id = azurerm_storage_sync_group.sync_group.id
  file_share_name       = azurerm_storage_share.share.name
  storage_account_id    = azurerm_storage_account.account.id
}
