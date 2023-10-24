locals {
  # Naming
  env = "test"
  loc = "world"

  # Deployment Parameters 
  subscription_id = "372372hryrhd2362placeholder"
  location        = "westus2"

  # Tags 
  technicalOwner = "me"
  businessOwner  = "you"

  # Networking 
  vnet_addressprefixes = ["172.17.0.0/16"]

  subnet_main_addressprefixes      = ["172.17.2.0/24"]
  subnet_apps_addressprefixes      = ["172.17.0.0/24"]
  subnet_databases_addressprefixes = ["172.17.1.0/24"]

  subnet_linux_apps_integration_addressprefixes = ["172.17.3.128/25"]
  subnet_mysql_integration_addressprefixes      = ["172.17.4.0/25"]

  # Database (WARNING: SENSITIVE INFORMATION SEE NOTES SECTION IN README FOR EXPLANATION)

  sql_server_login_name = "test@user.com"
  sql_server_password   = "NotaRealPassword"
  aad_login_username    = "test@user.com"
  object_id             = "8411414c-728e-11ee-b962-0242ac120002" #notaRealUUID

}