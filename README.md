# AnomolyDocker
Docker Compose file and other configuration files for Anomaly Server


## Configuration
There are 3 configurations that should be changed before running the server. These are:
1. The `docker-compose.yml` file
2. The `Caddy/CaddyFile` file
3. The `docker-entrypoint-initdb.d/mongo-init` file

1. Inside `docker-compose.yml` file `MONGO_INITDB_ROOT_USERNAME` and `MONGO_INITDB_ROOT_PASSWORD` environment variables should be changed to the username and password of the root user of the MongoDB database.
```bash
    Environment: 
      - MONGO_INITDB_ROOT_USERNAME=root     ## CHANGE THIS
      - MONGO_INITDB_ROOT_PASSWORD=example  ## CHANGE THIS
```

2. The Caddyfile should look loke this:
```bash
changeThisToYourDomain.com {  {
  reverse_proxy /graphql dockerIP:4000 
  ## if nothing else was chaged inside of the docker-compose.yml file, then the dockerIP should be: anomolyserver
}
```
3. The `docker-entrypoint-initdb.d/mongo-init` file should be changed to the following:
```bash
Only change the credatials unleas you now what you are doing

db.createUser(
    {
        user: "testUser1",  ## CHANGE THIS
        pwd: "1234",        ## CHANGE THIS
        roles: [
            {
                role: "readWrite",
                db: "anomoly"
            }
        ]
    }
)
```

## Installation
Run the following command to install the Anomaly Server
```bash
sudo ./build.sh
```

This will install the Anomaly Server on your machine using docker. After the installation, you can locally access the following services:

```bash
GraphQl: http://localhost:4000/graphql
MongoDB: http://localhost:27017
```

In addition, you should be able to access your graphQL API at your specified Domain



