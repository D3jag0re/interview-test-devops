output "rg_id" {
  value = azurerm_resource_group.create_rg.id
}
output "rg_name" {
  value = var.rg_name
}