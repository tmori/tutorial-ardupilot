#!/bin/bash

docker run -it --rm \
  --name ardupilot-sitl \
  -p 5760:5760 \
  -p 14550:14550 \
  ardupilot-sitl

#./Tools/autotest/sim_vehicle.py -v ArduCopter --console --map
