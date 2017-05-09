Run MsSQLServer on OSX

This Docker Compose configuration allows OSX users to run a microsoft database server in a docker instance.

Fire up the instance by running the following from repo's root directory

```
docker-compose up
```
The database should now be exposed for client requests at localhost:1433 with user="sa" and password="<YourStrong!Passw0rd>"



to check that the database is running by checking docker processes:
```
  docker ps
```
This will display any running docker containers.  Copy the container ID (usually the first column)


to connect to the database container:
```
  docker exec -it containerID bash
```
This will connect to the container, and open a bash session where you can issue commands against the database server.


Restore the database using the latest backup (must be connected to container):

```
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "RESTORE DATABASE [Horizon] FROM  DISK = N'Horizon.bak' WITH FILE = 1, MOVE N'Horizon' TO N'/var/opt/mssql/data/Horizon', MOVE 'Horizon_Log' TO N'/var/opt/mssql/data/Horizon_log', NOUNLOAD,  REPLACE,  STATS = 5"
```




