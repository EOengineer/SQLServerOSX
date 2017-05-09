FROM microsoft/mssql-server-linux


RUN ln -sfn /opt/mssql-tools/bin/sqlcmd /usr/bin/sqlcmd

