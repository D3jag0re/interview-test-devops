import pyodbc 
import subprocess
import mysql
import os 
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
import var 

# Connect To The Database (pyodbc.connect(string?))

connection_string = f"Driver={{MySQL ODBC 8.0 Unicode Driver}};Server={var.db_server};Database={var.db_name};Uid={var.db_username};Pwd={var.db_password}"
conn = pyodbc.connect(connection_string)
cursor = conn.cursor() 

# Perform Backup And Save Locally (if no shell = True will need --result-file=<path>)

backup_file_path = 'c:/temp/test.sql'
backup_command = f'mysqldump -u{var.db_username} -p{var.db_password} world > c:/temp/test.sql'
subprocess.run(backup_command, shell=True, check =True)

# Connect To Azure Blob Storage

blob_service_client = BlobServiceClient.from_connection_string(var.az_connection_string)
container_client = blob_service_client.get_container_client(var.container_name)

# Upload The Backup File To Azure Blob Storage 

blob_client = container_client.get_blob_client(var.blob_name)
with open(backup_file_path, "rb") as data:
    blob_client.upload_blob(data, overwrite=True)

# Delete The Local Backup 

os.remove(backup_file_path)

# Close DB Connection
conn.close()