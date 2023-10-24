output "app_insight_id" {
  value = azurerm_application_insights.app_insights.id
}
output "app_insight_name" {
  value = var.app_insights_name
}
output "app_insight_rg_name" {
  value = var.resourcegroup_name
}