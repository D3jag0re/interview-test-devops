resource "azurerm_resource_group" "create_rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.tags	
}