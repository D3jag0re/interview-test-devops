import pyodbc 
from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient
import var 
# Database Connection Details 
print(var.db_server)


# Connect To The Database (pyodbc.connect(string?))
connection_string = f"Driver={{MySQL ODBC 8.0 Unicode Driver}};Server={var.db_server};Database={var.db_name};Uid={var.db_username};Pwd={var.db_password}"
conn = pyodbc.connect(conn_str)
cursor = conn.cursos() 

# Perform Backup And Save Locally 


# Connect To Azure Blob Storage


# Upload The Backup File To Azure Blob Storage 


# Delete The Local Backup 


# Close DB Connection
#conn.close()