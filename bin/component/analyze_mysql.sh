#!/bin/bash

# set global constants
source ${HOME}/env.sh

# analyze slow queries
mysqldumpslow -s t "${MYSQL_LOG_PATH}" \
  > ${WORKSPACE}/bottleneck_analysis/db_summary.txt
