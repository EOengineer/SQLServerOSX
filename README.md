NOTE:  This branch is currently blocked


Currently fails due to ODBC issue listed here [https://connect.microsoft.com/SQLServer/feedback/details/2637102/odbc-driver-13-for-sql-server-cannot-connect-to-localdb-instance].

A fix is available in ODBC 13.1, but 13.1 has not yet made it into the official mssqlserver docker image.  Once that is done, this should be complete.

The Expected Error:

```
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Login timeout expired.
dataserver_1  | Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : TCP Provider: Error code 0x2749.
dataserver_1  | Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : A network-related or instance-specific error has occurred while establishing a connection to SQL Server. Server is not found or not accessible. Check if instance name is correct and if SQL Server is configured to allow remote connections. For more information see SQL Server Books Online..
```




Run MsSQLServer on OSX

This Docker Compose configuration allows OSX users to run a microsoft database server in a docker instance.

Fire up the instance by running the following from repo's root directory

```
docker-compose up
```

The database should now be exposed for client requests at localhost:1433 with user="sa" and password="<YourStrong!Passw0rd>"
