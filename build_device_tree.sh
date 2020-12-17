#!/bin/bash

source ./vars.sh

cd $JETPACK_DIR/bootloader
$JETPACK/kernel/dtc -I dts -O dtb -o cbo.dtb cbo.dts
