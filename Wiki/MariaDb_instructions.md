# MariaDB deployment Instructions


## My setup
**The bello instructions are for my setup. I tried to make them as generic i could in order to be deployed in a more general enviroment**

- Windows 10 
- WSL2
- Ubuntu 20.04
- Docker
## Enable WSL and install ubuntu 

Guide For wsl2 and ubuntu/debian install -> ***https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/***

## Install Docker

Guide for docker Installation -> ***https://gist.github.com/wholroyd/748e09ca0b78897750791172b2abb051***

This guide has information for wsl, docker and minukube

## Containirized MariaDB

Guide for mariaDb docker deployment -> ***https://mariadb.com/kb/en/installing-and-using-mariadb-via-docker/***

## Mysql Client 

For external communication with the mariadb you can install mysql-client
```shell
sudo apt install mysql-client
```
## Build the image



In the scope of this project we create a custom image. 

All the necessary files for this are in MariaDB folder.
### Prerequisites

- Docker and docker compose 

### Steps for deploy

1. Go in the MariaDB folder
```shell
ls -ltr                                                      
total 20
-rwxr-xr-x 1 antouan antouan 325 Apr 14 21:38 setup-mariadb.sh
-rwxr-xr-x 1 antouan antouan 216 Apr 14 21:49 open-mariadb.sh
-rwxr-xr-x 1 antouan antouan  83 Apr 14 21:56 grant_permissions.sql
-rw-r--r-- 1 antouan antouan 793 Apr 14 21:57 Dockerfile
-rw-r--r-- 1 antouan antouan 500 Apr 14 22:00 docker-compose.yml
```
2. Execute docker-compose build 
```shell
docker-compose build                                       
Building mariadb
[+] Building 0.3s (12/12) FINISHED                                                                       docker:default
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 832B                                                                               0.0s
 => [internal] load metadata for docker.io/library/ubuntu:20.04                                                    0.2s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [1/7] FROM docker.io/library/ubuntu:20.04@sha256:80ef4a44043dec4490506e6cc4289eeda2d106a70148b74b5ae91ee670e9  0.0s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 78B                                                                                   0.0s
 => CACHED [2/7] RUN apt-get update &&     apt-get install -y mariadb-server &&     rm -rf /var/lib/apt/lists/*    0.0s
 => CACHED [3/7] RUN mkdir -p /var/run/mysqld/ &&     chown -R mysql:mysql /var/run/mysqld/                        0.0s
 => CACHED [4/7] COPY setup-mariadb.sh /usr/local/bin/                                                             0.0s
 => CACHED [5/7] RUN chmod +x /usr/local/bin/setup-mariadb.sh                                                      0.0s
 => CACHED [6/7] COPY grant_permissions.sql /docker-entrypoint-initdb.d/                                           0.0s
 => CACHED [7/7] RUN chmod +r /docker-entrypoint-initdb.d/grant_permissions.sql                                    0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:ffd8ef54141d54867c236aa7f00f73cdbbf8fcba8a763578cc7df0b181b3023a                       0.0s
 => => naming to docker.io/library/mariadb_mariadb
```
3. Execute docker-compose up -d
```shell
docker-compose up -d                                         
Creating network "mariadb_custom_network" with driver "bridge"
Creating mariadb_mariadb_1 ... done
```

The Application Should be up and running

You can get in mariadb from inside the container, or from outside with an mysql client

### External Communication

- execute native mysql command from host machine
```shell
mysql -h 172.20.0.2 -P 3306 -u root -proot
# mysql -> native mysql-client command
# -h -> host ip // I set this up in the dockect-compose.yml
# -P -> Port // Also in the docker-compose.yml and the Dockerfile
# -u -> username // root from the setup-mariadb.sh script
# -proot -> -p parameter is for password // -proor gives the "root" password by default
```

### Internal Communication 

- We can connect to the db from inside the container

1. Get inside the container 
```shell
docker exec -it mariadb_mariadb_1 bash
```
2. Connect to DB
```shell
mysql -u root -proot


Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2 Ubuntu 20.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]

```

### Clean Enviroment

In order to clean the enviroment we follow the bellow instuction

- Clean
```shell
docker-compose down 

Stopping mariadb_mariadb_1 ... done
Removing mariadb_mariadb_1 ... done
Removing network mariadb_custom_network
```

- For a full clean you can also execute
```shell
docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)
```