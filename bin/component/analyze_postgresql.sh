#!/bin/bash

# set global constants
source ${HOME}/env.sh

# define UDFs for analyzing slow queries
psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d ${DB_NAME} \
  -f "${WORKSPACE}/conf/bottleneck_analysis/udf_analyze_slow_queries.sql"

# analyze slow queries
psql -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d ${DB_NAME} \
  -f "${WORKSPACE}/conf/bottleneck_analysis/analyze_queries.sql" \
  > ${WORKSPACE}/bottleneck_analysis/db_summary.txt
