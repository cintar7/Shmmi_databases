#!/bin/bash

# Set MariaDB configuration
cat << EOF > /etc/mysql/mariadb.conf.d/50-server.cnf
[mysqld]
bind-address = 0.0.0.0
skip-host-cache
skip-name-resolve
user = mysql
datadir = /var/lib/mysql
socket = /var/run/mysqld/mysqld.sock
local-infile=1

[client]
host = localhost
user = root
password = root

[mysql]
host = localhost
user = root
password = root
EOF