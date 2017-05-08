#!/bin/bash

# create target db
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "CREATE DATABASE [exampledb];"


sleep 5s

# restore server from backup
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "RESTORE DATABASE [Horizon] FROM DISK = N'Horizon.bak' WITH FILE = 1, MOVE N'Horizon' TO N'/var/opt/mssql/data/Horizon.mdf', MOVE N'Horizon_Log' TO N'/var/opt/mssql/data/Horizon_log.ldf', NOUNLOAD, REPLACE, STATS=1"
