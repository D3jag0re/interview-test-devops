output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_name" {
  value = var.vnet_name 
}
output "vnet_rg_name" {
  value = var.rg_name
}