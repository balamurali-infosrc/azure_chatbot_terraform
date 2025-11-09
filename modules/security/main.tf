data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = "${var.prefix}-kv"
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = true
}


#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = var.function_identity_object_id

#     secret_permissions = ["Get", "List", "Set"]
#   }
# }
