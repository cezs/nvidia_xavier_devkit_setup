#!/bin/bash

source ./vars.sh

cd $JETPACK/bootloader
$JETPACK/kernel/dtc -I dts -O dtb -o cbo.dtb cbo.dts
