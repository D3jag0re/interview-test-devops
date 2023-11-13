# Infrastructure Test 

Build out some basic Infrastructure for Azure using Terraform that can be used in a repeatable way. Bonus points for the following:

* Clearly explaining why you're doing things a certain way.
* Providing a PNG diagram of your infrastructure.

## Description

This will build out all the necessary resources in order to deploy an application to Azure App Service (their PaaS offering). This will include:

* 
* 

## Prerequisites

* Terraform installed
* Azure Account and Subscription

## Notes 

In order to minimize prerequisites and Azure configuration, you may be exposing some sensitive information in the code (namely SQL credentials), especially if you do not___.\

Normally, we would store these secrets in a Key Vault and retrieve them as part of our pipeline. This would require us to setup a key vault, self hosted agent, service principals etc. I did include an example pipeline yml that reflects how I would write a basic pipeline for Azure Pipelines (part of Azure DevOps)\
This deployment will utilize a single resource group to hold everything. In a bigger or multi-application environment, we could split resource groups up by type for better organization and visability (ex. Network, Data, Apps, etc.)\
This will also store the state file locally however I did provided a commented out block in providers.tf to show how you would set that up (requires a storage account to be created beforehand)\

## How to run



Notes:\
... naming conv. \
pipeline with ex var in az \
terraform show -json tfplan\ 
provider registration (req + error which can stop deploy)\
...have basic nginx container deploy to app service? Eventually deploy custom but where content is loaded via pipeline (seprate repo) 
