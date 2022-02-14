#!/bin/bash
set -e

# Options for starting Ganesha
: ${PCLOUD_USER:=""}
: ${PCLOUD_MOUNT:="/data"}

if [ ! -f /root/.pcloud/data.db ]
then
  echo "Starting pcloud Container, please run the folloring line to login to pcloud"
  echo "/usr/bin/pcloudcc -u ${PCLOUD_USER} -m ${PCLOUD_MOUNT} -p -s"
  exec sleep infinity
fi

echo "Starting pCloud Daemon"
exec /usr/bin/pcloudcc --username ${PCLOUD_USER} --mountpoint ${PCLOUD_MOUNT}
