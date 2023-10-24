/*
locals {
  sql_server_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Sql/servers/%s",var.subscription_id, var.resourcegroup_name, var.sql_servername)
}
local.sql_server_id
*/
resource "azurerm_mssql_database" "test" {
  name           = var.sql_dbname
  server_id      = var.server_id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.max_size_gb
  read_scale     = true
  sku_name       = var.sku_name
  zone_redundant = true
}

resource "azurerm_monitor_diagnostic_setting" "diag_la_workspace" {
  name               = "diag-${var.sql_dbname}"
  target_resource_id = azurerm_mssql_database.test.id
  log_analytics_workspace_id = var.la_workspace_id

  enabled_log {
    category_group = "allLogs"
  }

  metric {
    category = "Basic"
  }

  metric {
    category = "InstanceAndAppAdvanced"
  }

  metric {
    category = "WorkloadManagement"
  }
}