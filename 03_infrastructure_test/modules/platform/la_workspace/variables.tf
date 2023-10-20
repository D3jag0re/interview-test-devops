variable "resourcegroup_name" {
  type    = string
  description = " Name of the resource group is to be deployed"
}

variable "la_workspace_location" {
  type    = string
  description = "The location/region of LA Workspace"
  default     = "CanadaCentral"
}

variable "la_workspace_name" {
  type    = string
  description = "The name of LA Workspace"
}