#!/bin/bash

# set global constants
source ${HOME}/env.sh

# clear logs
if [ -f ${MYSQL_LOG_PATH} ]; then
  sudo /bin/rm ${MYSQL_LOG_PATH}
fi
sudo /usr/bin/touch ${MYSQL_LOG_PATH}
sudo /bin/chown postgres:adm ${MYSQL_LOG_PATH}
sudo /bin/chmod 640 ${MYSQL_LOG_PATH}

# apply new DB settings
sudo /bin/cp -b ${WORKSPACE}/conf/mysql/${MYSQL_OVERRIDE_CONF_FILE} ${MYSQL_OVERRIDE_CONF_PATH}
sudo /bin/chown postgres:postgres ${MYSQL_OVERRIDE_CONF_PATH}
sudo /bin/chmod 644 ${MYSQL_OVERRIDE_CONF_PATH}

# reload service
sudo /bin/systemctl --quiet start mysql.service
sudo /bin/systemctl --quiet enable mysql.service
