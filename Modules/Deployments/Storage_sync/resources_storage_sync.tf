resource "azurerm_storage_sync" "sync" {
  #depends_on          = [azurerm_resource_provider_registration.storage_sync]
  name                = local.resource_storage_sync_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
}

resource "azurerm_storage_sync_group" "sync_group" {
  name            = local.resource_storage_sync_group_name
  storage_sync_id = azurerm_storage_sync.sync.id
}

resource "azurerm_storage_sync_cloud_endpoint" "sync_cloud_endpoint" {
  name                  = local.resource_storage_sync_cloud_endpoint_name
  storage_sync_group_id = azurerm_storage_sync_group.sync_group.id
  file_share_name       = azurerm_storage_share.share.name
  storage_account_id    = azurerm_storage_account.account.id
}

resource "azurerm_private_endpoint" "storage_sync" {
  count               = var.provision_private_link == true ? 1 : 0
  name                = local.resource_storage_sync_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.service_network[0].subnet_id[0]

  private_service_connection {
    name                           = local.resource_storage_sync_name
    private_connection_resource_id = azurerm_storage_sync.sync.id
    subresource_names              = ["afs"]
    is_manual_connection           = false
  }
}
