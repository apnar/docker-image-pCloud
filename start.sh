#!/bin/bash
set -e

# Options for starting Ganesha
: ${PCLOUD_USER:=""}
: ${PCLOUD_MOUNT:="/data"}

if [ ! -f /root/.pcloud/data.db ]
then
  echo "Starting pCloud First Run - Enter Password"
  echo "/usr/bin/pcloudcc --username ${PCLOUD_USER} --mountpoint ${PCLOUD_MOUNT} --password --savepassword"
  exec /bin/bash -D
fi


echo "Starting pCloud Daemon"
exec /usr/bin/pcloudcc --username ${PCLOUD_USER} --mountpoint ${PCLOUD_MOUNT}
