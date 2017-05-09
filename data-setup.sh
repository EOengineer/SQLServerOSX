#!/bin/bash

#chmod +x /bin/data-setup.sh


echo running post install scripts for dbserver..;


# symlink sqlcmd
# ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd
# echo sqlcmd symlinked...;


# start the database server
/opt/mssql/bin/sqlservr.sh


# let the server come up
sleep 90s

# restore horizon db server from backup
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "RESTORE DATABASE [Horizon] FROM DISK = N'Horizon.bak' WITH FILE = 1, MOVE N'Horizon' TO N'/var/opt/mssql/data/Horizon.mdf', MOVE N'Horizon_Log' TO N'/var/opt/mssql/data/Horizon_log.ldf', NOUNLOAD,  REPLACE,  STATS = 5"
echo horizon restore kicked off...;

# restore caterease server
sqlcmd -S "0.0.0.0,1433" -U "SA" -P $SA_PASSWORD -d "master" -Q "RESTORE DATABASE [kimbo_caterease] FROM  DISK = N'kimbo_caterease.bak' WITH FILE = 1, MOVE N'CEC16Dev' TO N'/var/opt/mssql/data/kimbo_caterease_Data', MOVE N'CEC16DEV_Log' TO N'/var/opt/mssql/data/kimbo_caterease_log', NOUNLOAD,  REPLACE,  STATS = 5"
echo caterease restore kicked off...;
