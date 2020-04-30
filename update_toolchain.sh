#!/bin/bash

source ./vars.sh

mkdir -p ${HOME}/toolchain_bin_$VERSION
cd ${HOME}/toolchain_bin_$VERSION

if ! test -e ${TOOLCHAIN_SRC}.tar.gz; then 
    wget -O ${TOOLCHAIN_SRC}.tar.gz https://developer.nvidia.com/embedded/dlc/${TOOLCHAIN_SRC}
    tar -xf ${TOOLCHAIN_SRC}.tar.gz
fi
