#!/bin/bash

source ./vars.sh

# Create target directory
if [ -d "$KERNEL_OUT" ]; then
  mkdir -p $KERNEL_OUT
fi

cd ${JETPACK}/sources/kernel/${KERNEL_DIR}

# Create the .config file
make ARCH=arm64 O=$KERNEL_OUT tegra_defconfig

# Build the kernel and DTBs
make ARCH=arm64 O=$KERNEL_OUT CROSS_COMPILE=${CROSS_COMPILE} -j$(nproc)

# Install modules in temporal location
sudo make modules_install ARCH=arm64 O=$KERNEL_OUT CROSS_COMPILE=${CROSS_COMPILE} INSTALL_MOD_PATH=$KERNEL_MODULES_OUT

# Make a backup of the current image
BKUP_DATE=`date "+%Y_%m_%d_%H_%M_%S"`
mv ${JETPACK}/kernel/Image{,.$BKUP_DATE} 
mv ${JETPACK}/kernel/zImage{,.$BKUP_DATE} 
mv ${JETPACK}/kernel/kernel_supplements.tbz2{,.$BKUP_DATE}
mv ${JETPACK}/kernel/dtb{,.$BKUP_DATE}

# Deploy binaries in their required locations
cp ${KERNEL_OUT}/arch/arm64/boot/Image ${JETPACK}/kernel/
cp ${KERNEL_OUT}/arch/arm64/boot/zImage ${JETPACK}/kernel/
cp -r ${KERNEL_OUT}/arch/arm64/boot/dts ${JETPACK}/kernel/dtb

# Regenerate kernel modules supplement file
cd ${KERNEL_MODULES_OUT}
tar -v --owner root --group root -cjf ${JETPACK}/kernel/kernel_supplements.tbz2 lib/modules

# Generate JetPack image
cd ${JETPACK}/
sudo ./apply_binaries.sh
