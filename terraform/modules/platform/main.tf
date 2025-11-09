resource "azurerm_storage_account" "sa" {
  name                     = "${var.prefix}funcsa${var.environment}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
# resource "azurerm_app_service_plan" "plan" {
#   name                = "${var.prefix}-plan-${var.environment}"
#   location            = var.location
#   resource_group_name = var.rg_name
#   kind = "Linux"
#   reserved = true

#   sku {
#     tier     = "Standard"
#     size     = "S1"
#     capacity = 1
#   }
#     depends_on = [azurerm_app_service_plan.func]  
# }
resource "azurerm_service_plan" "plan" {
  name                = "${var.prefix}-plan-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.location

  os_type = "Linux"
#   kind    = "Linux"
  sku_name = "S1"

  timeouts {
    create = "30m"
  }
}

# resource "azurerm_service_plan" "plan" {
#   name                = "${var.prefix}-plan-${var.environment}"
#   resource_group_name = var.rg_name
#   location            = var.location

#   os_type     = "Linux"
#   sku_name    = "S1"  # ✅ Consumption plan
#   worker_count = 1
# }

# resource "azurerm_app_service_plan" "plan" {
#   name                = "${var.prefix}-plan-${var.environment}"
#   location            = var.location
#   resource_group_name = var.rg_name
#   kind                = "Linux"
#   reserved            = true

#   sku {
#     tier     = "Standard"
#     size     = "S1"
#     capacity = 1
#   }
# }

resource "azurerm_linux_function_app" "bot" {
  name                       = "${var.prefix}-func-${var.environment}"
  location                   = var.location
  resource_group_name        = var.rg_name
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  functions_extension_version = "~4" 

  site_config {
    application_stack {
      python_version = "3.10"
    }
  }

  identity {
    type = "SystemAssigned"
  }
}
