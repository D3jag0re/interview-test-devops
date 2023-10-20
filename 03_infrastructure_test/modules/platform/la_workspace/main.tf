resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_workspace_name
  location            = var.la_workspace_location
  resource_group_name = var.resourcegroup_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}