resource "azurerm_linux_web_app" "app_service_web" {
  name                = var.app_service_name
  resource_group_name = var.rg_name
  location            = var.app_service_location
  service_plan_id     = var.service_plan_id

  site_config {
    always_on = false 
    minimum_tls_version = "1.2"
    application_stack {
      python_version = "3.9"
    
  }
  }

}