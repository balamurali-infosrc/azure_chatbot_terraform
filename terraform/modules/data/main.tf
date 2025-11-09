# Generate a short random suffix to ensure global uniqueness for the storage account name
resource "random_string" "sa_suffix" {
  length  = 4
  special = false
  upper   = false
}
resource "azurerm_storage_account" "sa" {
   name = substr(
    lower(
      replace(
        replace(
          replace("${var.prefix}${var.environment}${random_string.sa_suffix.result}", "-", ""),
          "_", ""
        ),
        ".", ""
      )
    ),
    0,
    24
  )
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
#   allow_blob_public_access = false
}

resource "azurerm_storage_container" "transcripts" {
  name                  = "transcripts"
  storage_account_id = azurerm_storage_account.sa.id
#   storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "${var.prefix}cosmos${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name                = "botdb"
  resource_group_name = var.rg_name
  account_name        = azurerm_cosmosdb_account.cosmos.name
   depends_on = [
    azurerm_cosmosdb_account.cosmos]
}
