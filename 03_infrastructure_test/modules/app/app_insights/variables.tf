variable "resourcegroup_name" {
  type    = string
  description = " Name of the resource group is to be deployed"
}

variable "app_insights_location" {
  type    = string
  description = "The location/region of App Insights"
  default     = "CanadaCentral"
}

variable "app_insights_name" {
  type    = string
  description = "The name of App Insights"
}

variable "la_subscription_id" {
  type    = string
  description = "The subscription ID of LA Workspace"
}

variable "la_resourcegroup_name" {
  type    = string
  description = "The RG name of LA Workspace"
}

variable "la_workspace_name" {
  type    = string
  description = "The name of LA Workspace"
}