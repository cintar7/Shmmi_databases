#!/bin/bash

# Set MariaDB configuration
cat << EOF > /etc/mysql/mariadb.conf.d/50-server.cnf
[mysqld]
skip-host-cache
skip-name-resolve
user = mysql
datadir = /var/lib/mysql
socket = /var/run/mysqld/mysqld.sock

[client]
host = localhost
user = root
password = root

[mysql]
host = localhost
user = root
password = root
EOF
