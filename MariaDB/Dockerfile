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

# Set MariaDB configuration to allow external connections
# Copy SQL script into the container
COPY MariaDB/DATA/cooks.csv /tmp/
COPY MariaDB/DATA/episodeparticipations.csv /tmp/
COPY MariaDB/DATA/episodes.csv /tmp/
COPY MariaDB/DATA/equipment.csv /tmp/
COPY MariaDB/DATA/foodgroups.csv /tmp/
COPY MariaDB/DATA/images.csv /tmp/
COPY MariaDB/DATA/ingredients.csv /tmp/
COPY MariaDB/DATA/recipeequipment.csv /tmp/
COPY MariaDB/DATA/recipeingredients.csv /tmp/
COPY MariaDB/DATA/recipes.csv /tmp/
COPY MariaDB/DATA/recipethematicunits.csv /tmp/
COPY MariaDB/DATA/scores.csv /tmp/
COPY MariaDB/DATA/steps.csv /tmp/
COPY MariaDB/DATA/thematicunits.csv /tmp/
COPY MariaDB/DATA/users.csv /tmp/
COPY MariaDB/DATA/nutritionalinfo.csv /tmp/
COPY MariaDB/01_grant_permissions.sql /docker-entrypoint-initdb.d/
COPY MariaDB/02_db.sql /docker-entrypoint-initdb.d/
COPY MariaDB/03_populate.sql /docker-entrypoint-initdb.d/
# Grant permissions during container initialization
RUN chmod +rx /tmp/*.csv
RUN chmod +rx /docker-entrypoint-initdb.d/01_grant_permissions.sql
RUN chmod +rx /docker-entrypoint-initdb.d/02_db.sql
RUN chmod +rx /docker-entrypoint-initdb.d/03_populate.sql

# Expose port 3306
EXPOSE 3306

# Start the MariaDB server, run initialization scripts, then stop the server
RUN service mysql start && \
    mysql -u root -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;" && \
    mysql -u root -proot < /docker-entrypoint-initdb.d/01_grant_permissions.sql && \
    mysql --local-infile=1 -u root -proot < /docker-entrypoint-initdb.d/02_db.sql && \
    mysql --local-infile=1 -u root -proot < /docker-entrypoint-initdb.d/03_populate.sql && \
    service mysql stop
# Start MariaDB server
CMD ["bash", "-c", "/usr/local/bin/setup-mariadb.sh && mysqld"]


