#!/bin/bash

# create target db
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "CREATE DATABASE [exampledb];"

sleep 5s

# restore server from backup
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "RESTORE DATABASE [exampledb] FROM  DISK = N'var/backups/exampledb.bak' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5"
