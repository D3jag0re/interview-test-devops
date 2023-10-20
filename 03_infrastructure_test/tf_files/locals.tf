locals {
  # Naming
  env = ""
  loc = ""

  # Deployment Parameters 
  subscription_id = ""
  location = ""

  # Tags 
  technicalOwner = ""
  businessOwner = ""

   # Networking 
  vnet_addressprefixes = ["172.17.0.0/16"]

  subnet_main_addressprefixes = ["172.17.2.0/24"]
  subnet_apps_addressprefixes = ["172.17.0.0/24"]
  subnet_databases_addressprefixes = ["172.17.1.0/24"]
  
  subnet_linux_apps_integration_addressprefixes = ["172.17.3.128/25"]
  subnet_mysql_integration_addressprefixes = ["172.17.4.0/25"]
  
}