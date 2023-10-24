locals {
  vnet_id               = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/virtualNetworks/%s", var.subscription_id, var.vnet_rg_name, var.vnet_name)
  subnet_id             = format("%s/subnets/%s", local.vnet_id, var.subnet_name)
  error_link = format("https://%s..scm.azurewebsites.net/detectors?type=tools&name=eventviewer", var.app_service_name)
  web_app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.add_app_insight == "yes" ? data.azurerm_application_insights.app_insights.0.instrumentation_key : ""
    "ANCM_ADDITIONAL_ERROR_PAGE_LINK" = var.runtime_stack == "dotnetcore" ? local.error_link : ""
    "WEBSITE_NODE_DEFAULT_VERSION" = var.runtime_stack =="node" ? var.runtime_version : ""
  }
  log_analytics_log_categories     = ["AppServiceHTTPLogs", "AppServiceConsoleLogs","AppServiceAppLogs","AppServiceAuditLogs","AppServiceIPSecAuditLogs","AppServicePlatformLogs"]
}
data "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  resource_group_name = var.app_service_plan_rg_name
}
data "azurerm_application_insights" "app_insights"{
  count = var.add_app_insight == "yes" ? 1 : 0
  name = var.app_insight_name
  resource_group_name = var.app_insight_rg_name
}
resource "azurerm_app_service" "app_service_web" {
  name                = var.app_service_name
  location            = var.app_service_location
  resource_group_name = var.rg_name
  app_service_plan_id = data.azurerm_service_plan.asp.id
  app_settings = local.web_app_settings
  https_only = true
  client_affinity_enabled = true
  client_cert_enabled = false
  
  site_config {
    always_on = false
    min_tls_version = "1.2"
    linux_fx_version = var.kind == "linux" ? var.linux_framework_version : null
    php_version = (var.kind != "linux" && var.runtime_stack == "php") ? var.runtime_version : "7.0"
    dotnet_framework_version = (var.kind != "linux" && var.runtime_stack == "dotnetcore") ? var.runtime_version : null
    python_version = (var.kind != "linux" && var.runtime_stack == "python") ? var.runtime_version : null
    java_version = (var.kind != "linux" && var.runtime_stack == "java") ? var.runtime_version : null
    java_container = (var.kind != "linux" && var.runtime_stack == "java") ? var.java_container : null
    java_container_version = (var.kind != "linux" && var.runtime_stack == "java") ? var.java_container_version: null
  }

}

#-------------------------------------------------------------
# App Service Virtual Network Association - Default is "false"
#-------------------------------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "main" {
  count          = var.enable_vnet_integration == "enable" ? 1 : 0
  app_service_id = azurerm_app_service.app_service_web.id
  subnet_id      = local.subnet_id
}

/*
resource "azurerm_monitor_diagnostic_setting" "diag_la_workspace" {
  name               = "diag-${var.app_service_name}"
  target_resource_id = azurerm_app_service.app_service_web.id
  log_analytics_workspace_id = var.la_workspace_id

  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = false

    }
   
  }

  metric {
    category = "AllMetrics"

    #retention_policy {
      #enabled = false
    #}
  }
}

*/