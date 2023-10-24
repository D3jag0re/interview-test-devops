output "app_service_id" {
  value = azurerm_app_service.app_service_web.id
}

output "app_service_name" {
  value = var.app_service_name
}
