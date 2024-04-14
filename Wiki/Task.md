# Tasks 

## DB Tasks 

### Main
| No | Task                 | Description                                                        | Analysis                                                                                      | Status      |
|----|----------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|-------------|
| 1  | E-R                  | Create the E-R diagram and check how it can be deployed in MariaDB | How we can translate the E-R diagram into a working DB, also check the fisibility for mariadb | Ongoing     |
| 2  | DB Data              | Create the Data that will populate the DB                          | Analyse the requirments and create the data that will populate the DB                         | Not Started |
| 3  | DB Population        | Pupulate the DB with the data                                      | Populate the DB with the data and check that everything works corectly                        | Not Started |
| 4  | Analyse Queries      | Analyse the queries                                                | After the queries creation, execute them in the enviroment until everything looks Good        | Not Started |
| 5  | MariaDB docker image | Create the image for the deployment                                | Create Dockerfile and image that deploys on the fly the above and it's ready to go            | Not Started |
| 6  | Script Queries       | Automate The queries                                               | Create a way to automate the queries, extract the results and analyse them                    | Not Started |
| 7  | Demo Preparation     | Prepare for the demo (obvious Description)                         | Check that everything works according tou our demands and be ready for the batle              | Not Started |

### Sub
| No | Task           | Description                                  | Analysis                                               | Status      |
|----|----------------|----------------------------------------------|--------------------------------------------------------|-------------|
| 1  | Deploy MariaDB | Simple MariaDB Deploy in a docker enviroment | Deploy MariaDB, login and create a dummy DB as a poc   | Done        |
| 2  | DB Creation    | Create a Custom Image                        | that includes and executes a dummy DB creation Scripts | Ongoing     |
| 3  | DB Population  | Pupulate the DB with the data                | Include In the image the the data population           | Not Started |

## App Tasks (Not necessary, just for learning)
The above Tasks have no prio, are just for learning if you are tough mothefucka...

| No | Task                       | Description                                    | Analysis                                             | Status      |
|----|----------------------------|------------------------------------------------|------------------------------------------------------|-------------|
| 1  | MariaDB example            | Poc For mariaDB deployment in a container      | Deployed MariaDB in docker and created a dummy DB    | Done        |
| 2  | Java Example               | Poc For a simple Java program that communicates with the DB | Deploy The App in a container And connect to MariaDB | Ongoing     |
| 3  | Automate the above Procces | Create docker files and automate the proccess  | Auto MariaDB deploy with the DB and populated and App deploy on the fly | Not Started |
