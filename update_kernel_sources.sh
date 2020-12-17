#!/bin/bash

source ./vars.sh

cd ${JETPACK}
./source_sync.sh -t ${GIT_TAG}

