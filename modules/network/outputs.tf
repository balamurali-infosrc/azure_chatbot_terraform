output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app.id
}
