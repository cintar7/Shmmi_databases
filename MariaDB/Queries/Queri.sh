#!/bin/bash

# Define the output log file
LOG_FILE="/tmp/Queries/queries.log"

# Start fresh
> $LOG_FILE

# Function to run a query with markers
run_query_with_markers() {
    local query_file=$1
    local query_number=$2

    echo "-------Query $query_number Start--------" >> $LOG_FILE
    echo " " >> $LOG_FILE
    mysql --local-infile=1 -u root -proot dummy1 < $query_file >> $LOG_FILE
    echo "-------Query $query_number End--------" >> $LOG_FILE
    echo " " >> $LOG_FILE
}

# Query files
query_files=(
    "/tmp/Queries/query1.sql"
    "/tmp/Queries/query2.sql"
    "/tmp/Queries/query3.sql"
    "/tmp/Queries/query4.sql"
    "/tmp/Queries/query5.sql"
    "/tmp/Queries/query6.sql"
    "/tmp/Queries/query7.sql"
    "/tmp/Queries/query8.sql"
    "/tmp/Queries/query9.sql"
    "/tmp/Queries/query10.sql"
    "/tmp/Queries/query11.sql"
    "/tmp/Queries/query12.sql"
    "/tmp/Queries/query13.sql"
    "/tmp/Queries/query14.sql"
    "/tmp/Queries/query15.sql"
)

# Run queries
for i in "${!query_files[@]}"; do
    run_query_with_markers "${query_files[$i]}" "$((i+1))"
done
