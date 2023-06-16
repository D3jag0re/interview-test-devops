# DB Backup 

As per the requirements this will back up a database and send the output to a cloud storage solution. 

For this I will be backing up a MySQL database locally, sending the output to an Azure Storage Account, and then deleting the local backup copy. 

# Get Started 

What You will Need:

- MySQL Server Installed
- A Microsoft Azure Account with a subscription, resource-group and storage account created.
- Python Installed (see requirements.txt for required modules)

## Get a Database 

I decided to grab an example MySQL database from [HERE](https://dev.mysql.com/doc/index-other.html). I chose the 'world database' but it does not matter which one you chose.

## Create your vars file 

Create a file in this directory called 'var.py' and fill in your information. It should contain the following:

----------------------------------------------------
This File stores all the variables to run backup.py
 ----------------------------------------------------

Database Connection Details 

db_server = ''  

db_name = ''  

db_username = ''  

db_password = ''

Azure Blob Storage Details 

az_connection_string = ''
container_name = ''
blob_name = ''

----------------------------------------------------
End of File 
 ----------------------------------------------------

## Run The Code 

From the directory run 'py backup.py'. 
Note: mysqldump will warn you about using a passwork on the CLI. The program will still execute correctly. 