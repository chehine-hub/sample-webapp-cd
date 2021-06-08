#!/bin/bash

docker run --rm -v /root/maven-project/stages/flyway/sql:/flyway/sql flyway/flyway:latest-alpine migrate -placeholders.ENV=$ENV -defaultSchema=$ENV -schemas=$ENV -user=chehine -password=$SNOWFLAKE_PASSWORD -url="jdbc:snowflake://za76125.ca-central-1.aws.snowflakecomputing.com/?db=FLYWAY_METDATA&role=ACCOUNTADMIN" -validateMigrationNaming="true" info
