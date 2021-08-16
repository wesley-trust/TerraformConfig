# Assign reader and data access for Azure StorageSync principal to storage account
resource "azurerm_role_assignment" "reader_and_data_access" {
  scope                = azurerm_storage_account.account.id
  role_definition_name = "Reader and Data Access"
  principal_id         = var.resource_storage_sync_object_id
}
