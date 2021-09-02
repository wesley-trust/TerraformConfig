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

resource "azurerm_private_endpoint" "storage_account" {
  count               = var.provision_private_link == true ? 1 : 0
  name                = local.resource_storage_share_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.service_network[0].subnet_id[0]

  private_service_connection {
    name                           = local.resource_storage_share_name
    private_connection_resource_id = azurerm_storage_account.account.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
}