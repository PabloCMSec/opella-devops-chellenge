output "storage_account_name" {
  value = azurerm_storage_account.this.name
}
output "storage_account_primary_access_key" {
  value = azurerm_storage_account.this.primary_access_key
}
output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.this.primary_blob_endpoint
}