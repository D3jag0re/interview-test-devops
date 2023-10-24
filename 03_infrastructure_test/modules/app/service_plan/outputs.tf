output "app_service_plan_id" {
  value = azurerm_service_plan.example.id
}
output "app_service_plan_name" {
  value = var.app_service_plan_name
}
output "app_service_plan_rg_name" {
  value = var.rg_name
}