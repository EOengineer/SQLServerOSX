#!/bin/bash
ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd

sqlcmd -H "localhost" -U "SA" -P "<YourStrong!Passw0rd>" -Q "RESTORE DATABASE [exampledb] FROM  DISK = N'var/backups/exampledb.bak' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 5"
