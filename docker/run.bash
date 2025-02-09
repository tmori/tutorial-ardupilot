#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <host_mount_path>"
  exit 1
fi

HOST_MOUNT_PATH=$1

docker run -it --rm \
  --name ardupilot-sitl \
  -v "$HOST_MOUNT_PATH:/hakoniwa-drone-pro" \
  -p 5760:5760 \
  -p 14550:14550 \
  -p 9002:9002/udp \
  -p 9003:9003/udp \
  ardupilot-sitl


# UDPで接続対象の Mission Planner の IPアドレスを指定する
#　./Tools/autotest/sim_vehicle.py -v ArduCopter --console --map --out=udp:192.168.2.107:14550
#  ./Tools/autotest/sim_vehicle.py -v ArduCopter -f airsim-copter --console --map
# ./Tools/autotest/sim_vehicle.py -v ArduCopter  -w --model webots-python --add-param-file=./libraries/SITL/examples/Webots_Python/params/crazyflie.parm --out=udp:192.168.2.105:14550

# コンテナ→ホスト：
# ・コンテナ：nc -u host.docker.internal 9002
# ・ホスト    ： nc -l -u 127.0.0.1 9002
#
# ホスト→コンテナ：
# ・コンテナ：nc -l -u 0.0.0.0 9003
# ・ホスト   ：nc -u 127.0.0.1 9003 

# ./Tools/autotest/sim_vehicle.py -v ArduCopter -f airsim-copter --console --map   -A "--sim-port-in=9003 --sim-port-out=9002 -sim-address=127.0.0.1"
