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