#!/bin/bash

pid=$(pgrep gsc)

if [ -n "${pid}" ]; then
  kill -SIGHUP ${pid}
fi

#cmake_dir="$1"
path="/etc/gsc"
mkdir -p ${path}

wget -O /etc/gsc/active.txt 'http://celestrak.org/NORAD/elements/gp.php?GROUP=last-30-days&FORMAT=tle'

# web_addr="http://172.16.30.52:8000"
# sender="gsnotification38@gmail.com"
# recipient="stanislav.barantsev@community.isunet.edu"

# cmd="${path}/active_update.sh"
# cp -rfv ${cmake_dir}/active_update.sh ${path}
# crontab -l | { cat; echo "0 0 */5 * * ${cmd}"; } | crontab -

# azimuth controller
rotctld -s 9600 -m 1004 -r /dev/ttyUSB0 -T 127.0.0.1 -t 8080 -vvvvv

# elevation controller
rotctld -s 9600 -m 1005 -r /dev/ttyUSB1 -T 127.0.0.1 -t 8081 -vvvvv

tail -f /dev/null
