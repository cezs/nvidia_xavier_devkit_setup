# Get the latest links from https://developer.nvidia.com/embedded/linux-tegra

CC_PREFIX=aarch64-linux-gnu-
KERNEL_DIR=kernel-4.9
VERSION=32-3-1
TOOLCHAIN_SRC=l4t-gcc-7-3-1-toolchain-64-bit
TOOLCHAIN_DIR=gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu
JETPACK=${HOME}/nvidia/nvidia_sdk/JetPack_4.3_Linux_P2888/Linux_for_Tegra
CROSS_COMPILE=${HOME}/toolchain_bin_${VERSION}/${TOOLCHAIN_DIR}/bin/$CC_PREFIX
KERNEL_OUT=${HOME}/l4t_sources_${VERSION}/public_sources/kernel/${KERNEL_DIR}/build
KERNEL_MODULES_OUT=${JETPACK}/rootfs
GIT_TAG=tegra-l4t-r32.3.1

echo "VERSION: $VERSION"
echo "TOOLCHAIN_SRC: $TOOLCHAIN_SRC"
echo "TOOLCHAIN_DIR: $TOOLCHAIN_DIR"
echo "KERNEL_DIR: $KERNEL_DIR"
echo "CC_PREFIX: $CC_PREFIX"
echo "CROSS_COMPILE: $CROSS_COMPILE"
echo "KERNEL_OUT: $KERNEL_OUT"
echo "KERNEL_MODULES_OUT: $KERNEL_MODULES_OUT"
echo "GIT_TAG: $GIT_TAG"
