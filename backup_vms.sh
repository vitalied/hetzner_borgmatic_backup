#!/bin/bash -l

##
## Set environment variables
##

REPOSITORY_NAME="VMs"
CONFIG="/etc/borgmatic/borgmatic_config_${REPOSITORY_NAME,,}.yaml"
LOG="/var/log/borgmatic/backup_${REPOSITORY_NAME,,}.log"

trap 'echo $( date +"%Y-%m-%d %H:%M:%S" ) Backup interrupted >&2; exit 2' INT TERM

borgmatic --config $CONFIG --log-file $LOG  --verbosity 1 --log-file-verbosity 1 --monitoring-verbosity 1
