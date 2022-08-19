#!/bin/bash

# set global constants
source ${HOME}/env.sh

sudo /bin/systemctl --quiet stop mysql.service
sudo /bin/systemctl --quiet disable mysql.service
