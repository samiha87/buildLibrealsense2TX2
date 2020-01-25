#!/bin/bash
if [ $1 == "-p" ]; then
	BUILD_PATH=$2
fi

apt-add-repository universe
apt-get update
apt-get install pkg-config -y
cd /usr/src
#wget -N https://developer.download.nvidia.com/embedded/L4T/r32_Release_v1.0/jax-tx2/BSP/JAX-TX2-public_sources.tbz2
cd "$BUILD_PATH/"
echo "Get kernel files and download to $BUILD_PATH/"
wget -N https://developer.nvidia.com/embedded/dlc/r32-3-1_Release_v1.0/Sources/T186/public_sources.tbz2
#sudo tar -xvf JAX-TX2-public_sources.tbz2 public_sources/kernel_src.tbz2
sudo tar -xvf "$BUILD_PATH/public_sources.tbz2" Linux_for_Tegra/source/public/kernel_src.tbz2
tar -xvf "$BUILD_PATH/Linux_for_Tegra/source/public/kernel_src.tbz2"
#tar -xvf l4t-sources-32-1-JAX-TX2 public_sources/kernel_src.tbz2
#tar -xvf public_sources/kernel_src.tbz2
# Space is tight; get rid of the compressed kernel source
rm -r "$BUILD_PATH/Linux_for_Tegra"
cd kernel/kernel-4.9
# Go get the default config file; this becomes the new system configuration
zcat /proc/config.gz > .config

