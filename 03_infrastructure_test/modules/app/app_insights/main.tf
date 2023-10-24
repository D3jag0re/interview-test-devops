locals {
  la_workspace_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.OperationalInsights/workspaces/%s",var.la_subscription_id, var.la_resourcegroup_name, var.la_workspace_name)
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.app_insights_name
  location            = var.app_insights_location
  resource_group_name = var.resourcegroup_name
  workspace_id        = local.la_workspace_id
  application_type    = "web"
}