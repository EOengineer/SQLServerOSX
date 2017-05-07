#!/bin/bash
ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd



# start the mssql server
/opt/mssql/bin/sqlservr.sh


# let the server come up
sleep 20s && /bin/data-setup.sh



