#!/bin/bash

# set global constants
source ${HOME}/env.sh

# analyze slow Web APIs
ssh ${WEB_HOST} cat ${NGINX_LOG_PATH} \
  | alp ltsv --sort sum -r -q --qs-ignore-values \
  > ${WORKSPACE}/bottleneck_analysis/nginx_summary.txt

  # -m '/xxx/[0-9]+,/xxx/[0-9]+' \
