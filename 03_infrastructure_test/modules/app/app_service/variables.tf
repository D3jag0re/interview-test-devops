variable "subscription_id" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "app_service_plan_rg_name" {
  type = string
  description = "The Name of the resource group where the app service plan exists. In the same Resource Group you cannot mix Windows and Linux App Service Plan in the same region."
}
variable "app_service_plan_name" {
  type = string
  description = "The Name of the App service plan that should exist already while deploying the WebApp."
}
variable "app_service_name" {
  type        = string
  description = "App Service name"
}
variable "app_service_location" {
  type        = string
  description = "App Service location"
}
variable "kind" {
  type = string
  description = "App kind of the resource. The allowed values are as follows: windows, linx and api"
  validation {
    condition     = contains(["windows", "linux"], var.kind)
    error_message = "Valid values for kind are windows, linux"
  }
}
variable "linux_framework_version" {
  type = string
  description = "Linux runtime framework and version of the web app when the kind is linux."
  default = "null"
}
variable "runtime_stack" {
  type = string
  description = "Runtime framework for the web app when the kind is windows."
  default = "null"
}
variable "runtime_version" {
  type = string
  description = "Runtime framework version for the web app when the kind is windows."
  default = "null"
}
variable "java_container" {
  type = string
  description = "Name of the java container when the kind is windows and runtimeStack is java."
  default = "null"
}
variable "java_container_version" {
  type = string
  description = "Version of the java container when the kind is windows and runtimeStack is java."
  default = "null"
}
variable "enable_vnet_integration" {
  type = string
  validation {
    condition = contains(["enable", "disable"], var.enable_vnet_integration)
    error_message = "Variable enable_vnet_integration value should be either enable or disable."
  }
}
variable "vnet_rg_name" {
  description = "Resource Group Name of the VNet"
  type        = string
  default = "null"
}
variable "vnet_name" {
  description = "VNet name"
  type        = string
  default = "null"
}
variable "subnet_name" {
  description = "Subnet Name in the provided VNet"
  type    = string
  default = "null"
}
variable "add_app_insight" {
  type = string
  description = "It contains the option to add appinsight to the web app. Allowed values are, yes or no"
  validation {
    condition = contains(["yes", "no"], var.add_app_insight)
    error_message = "Variable add_app_insight value should be either yes or no."
  }
}
variable "app_insight_rg_name" {
  type = string
  description = "It contains the resource group name of the existing Application Insight."
  default = "null"
}
variable "app_insight_name" {
  type = string
  description = "It contains the resource group name of the existing Application Insight."
  default = "null"
}
variable "la_workspace_id" {
  type = string
  description = "Resource ID of LA workspace"
}
