resource "azurerm_service_plan" "app_service_plan" {
  name                      = var.app_service_plan_name
  location                  = var.app_service_plan_location
  resource_group_name       = var.rg_name
  os_type                   = var.os_type
  sku_name                  = var.sku
  #sku {
   # tier = var.sku_tier
   # size = var.sku_size
  #}
}
