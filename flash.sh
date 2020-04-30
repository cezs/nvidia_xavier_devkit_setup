#!/bin/bash

source ./vars.sh

cd ${JETPACK}
sudo ./flash.sh kernel jetson-xavier-as-8gb mmcblk0p1
