output "app_service_id" {
  value = azurerm_linux_web_app.app_service_web.id
}

output "app_service_name" {
  value = var.app_service_name
}
