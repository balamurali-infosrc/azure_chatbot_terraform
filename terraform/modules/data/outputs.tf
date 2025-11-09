output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "storage_container_transcripts" {
  value = azurerm_storage_container.transcripts.name
}

output "storage_account_primary_key" {
  value = azurerm_storage_account.sa.primary_access_key
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.cosmos.name
}
