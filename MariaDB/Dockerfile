FROM ubuntu:20.04

# Install MariaDB Server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Create directory for socket file
RUN mkdir -p /var/run/mysqld/ && \
    chown -R mysql:mysql /var/run/mysqld/

# Copy script to set up MariaDB configuration
COPY MariaDB/setup-mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup-mariadb.sh

# Copy SQL script into the container
COPY MariaDB/01_grant_permissions.sql /docker-entrypoint-initdb.d/
COPY MariaDB/02_db.sql /docker-entrypoint-initdb.d/
# Grant permissions during container initialization
RUN chmod +r /docker-entrypoint-initdb.d/01_grant_permissions.sql
RUN chmod +r /docker-entrypoint-initdb.d/02_db.sql
# Expose port 3306
EXPOSE 3306

# Start MariaDB server by executing the setup script and then mysqld
CMD ["bash", "-c", "/usr/local/bin/setup-mariadb.sh && exec mysqld"]
