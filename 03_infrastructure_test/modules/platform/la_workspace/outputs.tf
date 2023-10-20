output "ws_id" {
  value = azurerm_log_analytics_workspace.la_workspace.id
}

output "ws_rg_name" {
  value = var.resourcegroup_name
}

output "ws_name" {
  value = var.la_workspace_name
}