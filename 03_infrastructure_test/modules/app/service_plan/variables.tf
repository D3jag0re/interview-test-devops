variable "rg_name" {
  type        = string
  description = " Name of the resource group where the app service plan is to be deployed"
}

variable "app_service_plan_location" {
    description = "The location/region for your service plan. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
    default     = "westeurope"
}

variable "app_service_plan_name" {
  type = string
  description = "The Name of the App service plan that you want to create."
}

variable "os_type" {
  type = string
  description = "App kind of the resource. The allowed values are as follows: windows & Linux."
  validation {
      condition = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
      error_message = "Valid values for kind are windows & Linux only."
    }
}

variable "sku" {
  type = string 
  description = "pricing tier/Sku of an app service plan determines features of app service"
  validation {
  condition = contains(["B1", "B2", "B3", "D1", "F1","I1", "I2", "I3", "I1v2", "I2v2", "I3v2", "P1v2", "P2v2", "P3v2", "P1v3", "P2v3", "P3v3", "S1", "S2", "S3","EP1", "EP2", "EP3", "WS1", "WS2", "WS3"], var.sku)
  error_message = "Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3,EP1, EP2, EP3, WS1, WS2, and WS3."
  }
}
