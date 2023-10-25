variable "app_service_name" {
  type        = string
  description = "App Service name"
}

variable "rg_name" {
  type        = string
  description = "Resource group to be deployed in"
}

variable "app_service_location" {
  type        = string
  description = "App Service location"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the service plan being used"
}
