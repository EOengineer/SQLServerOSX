Run MsSQLServer on OSX

This Docker Compose configuration allows OSX users to run a microsoft database server in a docker instance.

Fire up the instance by running the following from repo's root directory

```
docker-compose up
```

The database should now be exposed for client requests at localhost:1433 with user="sa" and password="<YourStrong!Passw0rd>"
