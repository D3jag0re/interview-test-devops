import pyodbc 
import subprocess
import mysql
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
import var 
# Database Connection Details 
print(var.db_server)


# Connect To The Database (pyodbc.connect(string?))

connection_string = f"Driver={{MySQL ODBC 8.0 Unicode Driver}};Server={var.db_server};Database={var.db_name};Uid={var.db_username};Pwd={var.db_password}"
conn = pyodbc.connect(connection_string)
cursor = conn.cursor() 

# Perform Backup And Save Locally (if no shell = True will need --result-file=<path>)

#backup_file_path = 'C:/temp'
backup_command = f'mysqldump -u{var.db_username} -p{var.db_password} world > c:/temp/test.sql'
subprocess.run(backup_command, shell=True, check =True)


# Connect To Azure Blob Storage


# Upload The Backup File To Azure Blob Storage 


# Delete The Local Backup 


# Close DB Connection
#conn.close()