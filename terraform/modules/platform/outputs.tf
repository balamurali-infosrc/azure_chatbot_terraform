output "function_identity_object_id" {
  value = azurerm_linux_function_app.bot.identity[0].principal_id
}

output "function_app_name" {
  value = azurerm_linux_function_app.bot.name
}
