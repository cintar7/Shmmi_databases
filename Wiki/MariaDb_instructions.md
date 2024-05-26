Prerequisites of db installation:
Docker
Docker compose
Access to the internet
WSL or Linux system, works on Windows but our implementation was WSL 2 Ubuntu 22.04
MySQL client
Steps of installation:
Install wsl : Guide For wsl2 and ubuntu/debian install -> https://pureinfotech.com/install-windows-subsystem-linux-2-windows-10/
Install Docker: Guide for docker Installation -> https://gist.github.com/wholroyd/748e09ca0b78897750791172b2abb051
Install Docker compose: Guide for docker compose installation ->https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
Install MySQL client for external communication: sudo apt install mysql-client
Download the files from github repo
Go to the root folder of the downloaded repo
Execute docker-compose build
Execute docker-compose up -d
You can stop this by docker-compose down -v
Execute ‘mysql -h 172.22.0.2 -P 3306 -u root -proot’ in order to connect to MySQL database externally
Alternatively, you can first login to the container docker exec -ti mariadb-0 bash and then execute mysql
Alternatively, you can login to the phpmyadmin gui which manages the database by opening a Chrome or Firefox tab and use the url http://localhost:8080 with these credentials mariadb/root/root
After these steps you can execute sql queries in order to view the database
```