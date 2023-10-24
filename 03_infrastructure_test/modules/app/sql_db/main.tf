locals {
  sql_server_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Sql/servers/%s",var.subscription_id, var.resourcegroup_name, var.sql_servername)
}

resource "azurerm_mssql_database" "sql_db" {
  name                                =  var.sql_dbname
  server_id                           =  local.sql_server_id 
  collation                           =  "SQL_Latin1_General_CP1_CI_AS"
  sku_name                            =  var.sku_name           
  max_size_gb                         =  var.max_size_gb
  min_capacity                        =  0
  transparent_data_encryption_enabled =  true
}

resource "azurerm_monitor_diagnostic_setting" "diag_la_workspace" {
  name               = "diag-${var.sql_dbname}"
  target_resource_id = azurerm_mssql_database.sql_db.id
  log_analytics_workspace_id = var.la_workspace_id

  enabled_log {
    category_group = "allLogs"

    #retention_policy {
    #  enabled = false
    #}
  }

  metric {
    category = "Basic"

    #retention_policy {
    #  enabled = false
    #}
  }

  metric {
    category = "InstanceAndAppAdvanced"

    #retention_policy {
    #  enabled = false
    #}
  }

  metric {
    category = "WorkloadManagement"

    #retention_policy {
    #  enabled = false
    #}
  }
}