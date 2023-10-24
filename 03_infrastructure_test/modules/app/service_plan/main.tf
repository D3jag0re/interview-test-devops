resource "azurerm_service_plan" "example" {
  name                = var.app_service_plan_name
  resource_group_name = var.rg_name
  location            = var.app_service_plan_location
  os_type             = var.os_type
  sku_name            = var.sku
}