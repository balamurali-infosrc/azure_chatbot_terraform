resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}
resource "azurerm_cognitive_account" "cog" {
  name                = "${var.prefix}-cogaaa-${var.environment}-${random_string.suffix.result}"
  resource_group_name = var.rg_name
  location            = var.location
  kind                = "CognitiveServices"
  sku_name            = "S0"

#  restore = true
}


resource "azurerm_search_service" "search" {
  name                = "${var.prefix}-srch-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "standard"
  semantic_search_sku = "standard"
}
