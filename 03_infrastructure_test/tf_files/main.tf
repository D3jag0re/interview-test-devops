# ------------------------------ #
# Resource Group
# ------------------------------ #

module "resource_group_main" {
  source      = "../modules/platform/resource_group"
  rg_name     = "main-${local.env}-${local.loc}-rg-01"
  rg_location = local.location
  tags = {
    applicationName = "main"
    environment     = "${local.env}"
    costCenter      = "demo"
    createdBy       = "Terraform"
    technicalOwner  = "${local.technicalOwner}"
    businessOwner   = "${local.businessOwner}"
    projectID       = "742617000027"
    creationDate    = timestamp()
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
  source                 = "../../Modules/platform/subnets"
  rg_name                = module.resource_group_main.rg_name
  vnet_name              = module.virtual_network_main.vnet_name
  subnet_name            = "apps-${local.env}-${local.loc}-snet"
  subnet_addressprefixes = local.subnet_apps_addressprefixes
  depends_on             = [module.resource_group_main, module.virtual_network_main]
}

module "subnet_databases" {
  source                 = "../../Modules/platform/subnets"
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
  la_workspace_name     = "vcc-shared-${local.env}-${local.loc}-loganal-01"
  depends_on            = [module.resource_group_shared]
}

# ------------------------------ #
# Private DNS Zone 
# ------------------------------ #


# ------------------------------ #
# Private Endpoint
# ------------------------------ #


# ------------------------------ #
# App Insights
# ------------------------------ #


# ------------------------------ #
# App Service 
# ------------------------------ #


# ------------------------------ #
# Databases
# ------------------------------ #


