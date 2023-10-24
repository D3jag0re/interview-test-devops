# ------------------------------ #
# Resource Group
# ------------------------------ #

module "resource_group_main" {
  source      = "../modules/platform/resource_group"
  rg_name     = "main-${local.env}-${local.loc}-rg-01"
  rg_location = local.location
  tags = {
    appName        = "main"
    environment    = "${local.env}"
    costCenter     = "demo"
    createdBy      = "Terraform"
    technicalOwner = "${local.technicalOwner}"
    businessOwner  = "${local.businessOwner}"
    projectID      = "742617000027"
    creationDate   = timestamp()
  }
}

# ------------------------------ #
# Virtual Network
# ------------------------------ #

module "virtual_network_main" {
  source               = "../modules/platform/vNet"
  rg_name              = module.resource_group_main.rg_name
  vnet_name            = "main-${local.env}-${local.loc}-vnet-01"
  vnet_location        = local.location
  vnet_addressprefixes = local.vnet_addressprefixes
  custom_dns           = false
  dns_servers          = []
  depends_on           = [module.resource_group_main]
}

# ------------------------------ #
# Subnets
# ------------------------------ #

module "subnet_services" {
  source                 = "../modules/platform/subnets"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_dev.vnet_name
  subnet_name            = "services-${local.env}-${local.loc}-snet"
  subnet_addressprefixes = local.subnet_main_addressprefixes
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

module "subnet_apps" {
  source                 = "../modules/platform/subnets"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_main.vnet_name
  subnet_name            = "apps-${local.env}-${local.loc}-snet"
  subnet_addressprefixes = local.subnet_apps_addressprefixes
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

module "subnet_databases" {
  source                 = "../modules/platform/subnets"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_main.vnet_name
  subnet_name            = "databases-${local.env}-${local.loc}-snet"
  subnet_addressprefixes = local.subnet_databases_addressprefixes
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

module "subnet_linux_app_integration_main" {
  source                 = "../modules/platform/subnets_delegation"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_main.vnet_name
  subnet_name            = "main${local.env}-${local.loc}-linux-app-integration"
  subnet_addressprefixes = local.subnet_linux_apps_integration_addressprefixes
  delegation_name        = "linuxappelegation"
  svc_delegation_name    = "Microsoft.Web/serverFarms"
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

module "subnet_mysql_integration" {
  source                 = "../modules/platform/subnets_delegation"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_main.vnet_name
  subnet_name            = "main-${local.env}-${local.loc}-mysql-integration"
  subnet_addressprefixes = local.subnet_mysql_integration_addressprefixes
  delegation_name        = "myflexibledelegation"
  svc_delegation_name    = "Microsoft.DBforMySQL/flexibleServers"
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

# ------------------------------ #
# Network Security Groups
# ------------------------------ #

module "nsg_subnet_services" {
  source               = "../modules/platform/nsg"
  resource_group_name  = module.resource_group_main.rg_name
  virtual_network_name = module.virtual_network_main.vnet_name
  subnet_name          = module.subnet_services.subnet_name
  subnet_association   = "true"
  nsg_name             = "services-${local.env}-${local.loc}-nsg"
  nsg_location         = local.location
  depends_on           = [module.subnet_services]
}

module "nsg_subnet_apps" {
  source               = "../modules/platform/nsg"
  resource_group_name  = module.resource_group_main.rg_name
  virtual_network_name = module.virtual_network_main.vnet_name
  subnet_name          = module.subnet_apps.subnet_name
  subnet_association   = "true"
  nsg_name             = "apps-${local.env}-${local.loc}-nsg"
  nsg_location         = local.location
  depends_on           = [module.subnet_apps]
}

module "nsg_subnet_databases" {
  source               = "../modules/platform/nsg"
  resource_group_name  = module.resource_group_main.rg_name
  virtual_network_name = module.virtual_network_main.vnet_name
  subnet_name          = module.subnet_databases.subnet_name
  subnet_association   = "true"
  nsg_name             = "databases-${local.env}-${local.loc}-nsg"
  nsg_location         = local.location
  depends_on           = [module.subnet_databases]
}

module "nsg_subnet_linux_apps_integration" {
  source               = "../modules/platform/nsg"
  resource_group_name  = module.resource_group_main.rg_name
  virtual_network_name = module.virtual_network_main.vnet_name
  subnet_name          = module.subnet_linux_apps_integration_main.subnet_name
  subnet_association   = "true"
  nsg_name             = "linuxai-${local.env}-${local.loc}-nsg"
  nsg_location         = local.location
  depends_on           = [module.subnet_linux_apps_integration]
}

module "nsg_subnet_mysql_integration" {
  source               = "../modules/platform/nsg"
  resource_group_name  = module.resource_group_main.rg_name
  virtual_network_name = module.virtual_network_main.vnet_name
  subnet_name          = module.subnet_mysql_integration_main.subnet_name
  subnet_association   = "true"
  nsg_name             = "mysqlint-${local.env}-${local.loc}-nsg"
  nsg_location         = local.location
  depends_on           = [module.subnet_mysql_integration]
}

# ------------------------------ #
# Log Analytics Workspace
# ------------------------------ #

module "la_workspace" {
  source                = "../modules/platform/la_workspace"
  resourcegroup_name    = module.resource_group_shared.rg_name
  la_workspace_location = local.location
  la_workspace_name     = "shared-${local.env}-${local.loc}-logan"
  depends_on            = [module.resource_group_shared]
}

# ------------------------------ #
# Private DNS Zone 
# ------------------------------ #

module "private_dns_zone_appservice" {
  source                = "../modules/platform/private_dns_zone"
  private_dns_zone_name = "privatelink.azurewebsites.net"
  rg_name               = module.resource_group_main.rg_name
  vnet_subscription_id  = local.subscription_id
  vnet_rg_name          = module.virtual_network_main.vnet_rg_name
  vnet_name             = module.virtual_network_main.vnet_name
  depends_on            = [module.resource_group_main]
}

module "private_dns_zone_mssql" {
  source                = "../modules/platform/private_dns_zone"
  private_dns_zone_name = "privatelink.database.windows.net"
  rg_name               = module.resource_group_main.rg_name
  vnet_subscription_id  = local.subscription_id
  vnet_rg_name          = module.virtual_network_main.vnet_rg_name
  vnet_name             = module.virtual_network_main.vnet_name
  depends_on            = [module.resource_group_main]
}

# ------------------------------ #
# Private Endpoint
# ------------------------------ #
module "private_endpoint_appservice_linux" {
  source              = "../modules/platform/private_endpoint"
  resource_name       = "app-${local.env}-${local.loc}-appservice-01"
  location            = local.location
  rg_name             = module.resource_group_main.rg_name
  subnet_id           = module.subnet_apps.subnet_id
  private_dns_zone_id = module.private_dns_zone_appservice.zone_id
  subresource_name    = "sites"
  resource_id         = module.app_service_windows.app_service_id
  depends_on          = [module.private_dns_zone_appservice, module.app_service_windows]
}

# ------------------------------ #
# App Insights
# ------------------------------ #

module "app_insights" {
  source                = "../modules/app/app_insights"
  resourcegroup_name    = module.resource_group_main.rg_name
  app_insights_location = local.location
  app_insights_name     = "shared-${local.env}-${local.loc}-appis"
  la_subscription_id    = local.subscription_id
  la_resourcegroup_name = module.la_workspace.ws_rg_name
  la_workspace_name     = module.la_workspace.ws_name
  depends_on            = [module.resource_group_main, module.la_workspace]
}

# ------------------------------ #
# App Service 
# ------------------------------ #

module "app_service_plan_linux" {
  source                    = "../modules/app/app_service_plan"
  rg_name                   = module.resource_group_main.rg_name
  app_service_plan_location = local.location
  app_service_plan_name     = "app-${local.env}-${local.loc}-appsvcplan"
  os_type                   = "Linux"
  sku                       = "P1v2"
  depends_on                = [module.resource_group_app]
}

module "app_service_linux" {
  source                   = "../modules/app/app_service"
  subscription_id          = local.subscription_id
  rg_name                  = module.resource_group_main.rg_name
  app_service_plan_rg_name = module.app_service_plan_linux.app_service_plan_rg_name
  app_service_plan_name    = module.app_service_plan_linux.app_service_plan_name
  app_service_name         = "app-${local.env}-${local.loc}-appservice"
  app_service_location     = local.location
  kind                     = "linux"
  linux_framework_version  = "PHP|8.2"
  runtime_stack            = ""
  runtime_version          = ""
  java_container           = ""
  java_container_version   = ""
  add_app_insight          = "yes"
  app_insight_rg_name      = module.app_insights.app_insight_rg_name
  app_insight_name         = module.app_insights.app_insight_name
  enable_vnet_integration  = "enable"
  vnet_rg_name             = module.virtual_network_main.vnet_rg_name
  vnet_name                = module.virtual_network_main.vnet_name
  subnet_name              = module.subnet_linux_apps_integration.subnet_name
  la_workspace_id          = module.la_workspace.ws_id
  depends_on               = [module.app_service_plan_linux, module.subnet_linux_apps_integration, module.app_insights]
}

# ------------------------------ #
# Databases
# ------------------------------ #

module "mssql_server" {
  source                = "../modules/app/sql_server"
  sql_server_name       = "data-${local.env}-${local.loc}-sqlsrv"
  sql_server_rg_name    = module.resource_group_main.rg_name
  sql_server_location   = local.location
  sql_server_login_name = local.sql_server_login_name
  sql_server_password   = local.sql_server_password
  aad_login_username    = local.aad_login_username
  object_id             = local.object_id
  depends_on            = [module.resource_group_main]
}

module "mssql_database" {
  source             = "../modules/app/sql_db"
  resourcegroup_name = module.resource_group_data.rg_name
  server_id          = module.mssql_server.mssql.id
  sql_servername     = module.mssql_server.sql_server_name
  sql_dbname         = "data-${local.env}-${local.loc}-sqldb"
  sqldb_tier         = "Standard"
  sku_name           = "S2"
  max_size_gb        = 250
  la_workspace_id    = module.la_workspace.ws_id
  depends_on         = [module.mssql_server]
}

# ------------------------------ #
#             END 
# ------------------------------ # 
