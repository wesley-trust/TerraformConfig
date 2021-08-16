resource "azurerm_role_assignment" "data_access" {
  #name               = "00000000-0000-0000-0000-000000000000"
  scope              = azurerm_storage_account.account.id
  #role_definition_id = azurerm_role_definition.example.role_definition_resource_id
  role_definition_name = "Reader and Data Access"
  principal_id       = "a7ddc9cc-daee-4e0a-be3f-027903915879"
}