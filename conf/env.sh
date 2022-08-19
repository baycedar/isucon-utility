# contest workspace (root of git repository)
WORKSPACE="/home/isucon"

# server declaration
WORKERS="localhost"
#WORKERS="worker1 worker2 worker3" # use space for delimiter
WEB_HOST="localhost"
APP_HOST="localhost"
DB_HOST="localhost"

# app declaration
APP_LANG="go"
SERVICE_NAME="isuxxx"
SERVICE_FILE="${SERVICE_NAME}.${APP_LANG}.service"

# app static files settings
APP_DIR="${WORKSPACE}/webapp/${APP_LANG}"
APP_OUT_LOG_PATH="${APP_DIR}/stdout.log"
APP_ERR_LOG_PATH="${APP_DIR}/stderr.log"
APP_SERVICE_PATH="/etc/systemd/system/${SERVICE_FILE}"

# Nginx static file settings
NGINX_LOG_PATH="/var/log/nginx/access.log"
NGINX_ERR_LOG_PATH="/var/log/nginx/error.log"
NGINX_CONF_PATH="/etc/nginx/nginx.conf"
NGINX_SITE_PATH="/etc/nginx/sites-available/${SERVICE_NAME}.conf"

# DB settings
DB_PORT="3306"
DB_USER="isucon"
DB_NAME="${SERVICE_NAME}"

# DB static file settings
PG_LOG_PATH="/var/log/postgresql/postgresql-12-main.log"
PG_CONF_DIR="/etc/postgresql/12/main"
PG_BASE_CONF_FILE="0_base_settings.conf"
PG_BASE_CONF_PATH="${PG_CONF_DIR}/conf.d/${PG_BASE_CONF_FILE}"
PG_HBA_PATH="${PG_CONF_DIR}/pg_hba.conf"

# MySQL file settings
MYSQL_LOG_PATH="/var/log/mysql/slow_query.log"
MYSQL_CONF_DIR="/etc/mysql"
MYSQL_OVERRIDE_CONF_FILE="override.conf"
MYSQL_OVERRIDE_CONF_PATH="${MYSQL_CONF_DIR}/conf.d/${MYSQL_OVERRIDE_CONF_FILE}"
