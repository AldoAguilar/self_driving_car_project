#!/bin/bash
# Build kernel to include tegra usb firmware

JETSON_MODEL="NVIDIA Jetson Nano Developer Kit"
L4T_TARGET="32.4.2"
L4T_VERSION=vL4T$L4T_TARGET
KERNEL_RELEASE="4.9"
LIBREALSENSE_VERSION=v2.25.0

KERNEL_SOURCE_URL="https://developer.nvidia.com/embedded/L4T/r32_Release_v4.2/Sources/T210/public_sources.tbz2"
SOURCE_TARGET="/usr/src/"

INSTALL_DIR=$PWD
LIBREALSENSE_DIRECTORY=${HOME}/librealsense

JETSON_BOARD=$(tr -d '\0' </proc/device-tree/model)

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function check_L4T_version()
{   
    if [ -f /etc/nv_tegra_release ]; then
		JETSON_L4T_STRING=$(head -n 1 /etc/nv_tegra_release)
		JETSON_L4T_RELEASE=$(echo $JETSON_L4T_STRING | cut -f 2 -d ' ' | grep -Po '(?<=R)[^;]+')
		JETSON_L4T_REVISION=$(echo $JETSON_L4T_STRING | cut -f 2 -d ',' | grep -Po '(?<=REVISION: )[^;]+')
		JETSON_L4T_VERSION="$JETSON_L4T_RELEASE"".""$JETSON_L4T_REVISION"
	
	else
		echo "$LOG Reading L4T version from \"dpkg-query --show nvidia-l4t-core\""

		JETSON_L4T_STRING=$(dpkg-query --showformat='${Version}' --show nvidia-l4t-core)
        # For example: 32.2.1-20190812212815
        JETSON_L4T_VERSION=$(echo $JETSON_L4T_STRING | cut -d '-' -f 1)
        JETSON_L4T_RELEASE=$(echo $JETSON_L4T_VERSION | cut -d '.' -f 1)
        # # operator remove prefix in string operations in bash script. Don't forget . eg "32."
        JETSON_L4T_REVISION=${JETSON_L4T_VERSION#$JETSON_L4T_RELEASE.}
    fi
	echo "$LOG Jetson BSP Version:  L4T R$JETSON_L4T_VERSION"

}

echo "Getting L4T Version"
check_L4T_version
JETSON_L4T="$JETSON_L4T_VERSION"
echo "Jetson_L4T="$JETSON_L4T

# Error out if something goes wrong
set -e

# Check to make sure we're installing the correct kernel sources
# Determine the correct kernel version
if [ "$JETSON_BOARD" == "$JETSON_MODEL" ] ; then 
	if [ $JETSON_L4T != "$L4T_TARGET" ] ; then
		echo ""
		echo "${red}==== L4T Kernel Version Mismatch! =============${reset}"
		echo ""
		echo "This repository is for modifying the kernel for a L4T "$L4T_TARGET "system." 
		echo "You are attempting to modify a L4T "$JETSON_MODEL "system with L4T "$JETSON_L4T
		echo "The L4T releases must match!"
		echo ""
		echo "There may be versions in the tag/release sections that meet your needs"
		echo ""
		exit 1
	fi
else 
   echo "${red}==== Jetson Board Mismatch! =============${reset}"
   echo "Currently this script works for the $JETSON_MODEL."
   echo "This processor appears to be a $JETSON_BOARD, which does not have a corresponding script"
   echo ""
   echo "Exiting"
   exit 1
fi

# Check to see if source tree is already installed, if not the install it
PROPOSED_SRC_PATH="$SOURCE_TARGET""kernel/kernel-"$KERNEL_RELEASE
echo "Proposed source path: ""$PROPOSED_SRC_PATH"
if [ -d "$PROPOSED_SRC_PATH" ]; then
	echo "==== Kernel source appears to already be installed =============== "
else 
	echo "${green}Installing Kernel Sources${reset}"

	# Update and install dependencies
	apt-add-repository universe
	apt-get update
	apt-get install pkg-config -y
	apt-get install libncurses5-dev -y

	# Create Source Target directory if not exist
	echo "Installing kernel sources in: ""$SOURCE_TARGET"
	if [ ! -d "$SOURCE_TARGET" ]; then
   		echo "Creating directory: ""$SOURCE_TARGET"
   		mkdir -p "$SOURCE_TARGET"
	fi

	cd $SOURCE_TARGET

	# Get Kernel Sources
	wget -N $KERNEL_SOURCE_URL
	tar -xvf public_sources.tbz2  Linux_for_Tegra/source/public/kernel_src.tbz2 --strip-components=3
	tar -xvf kernel_src.tbz2
	# Space is tight; get rid of the compressed kernel source
	rm -r kernel_src.tbz2
	cd kernel/kernel-4.9
	# Go get the default config file; this becomes the new system configuration
	zcat /proc/config.gz > .config
	# Make a backup of the original configuration
	cp .config config.orig
	bash scripts/config --file .config --set-str LOCALVERSION "-tegra"

fi

# Is librealsense on the device?
if [ ! -d "$LIBREALSENSE_DIRECTORY" ] ; then
	echo "The librealsense repository directory is not available, it will be downloaded"
	# clone librealsense
	cd ${HOME}
	echo "${green}Cloning librealsense${reset}"
	git clone https://github.com/IntelRealSense/librealsense.git
fi

# Checkout version the last tested version of librealsense
cd $LIBREALSENSE_DIRECTORY
git checkout $LIBREALSENSE_VERSION

# Switch back to the script directory
cd $INSTALL_DIR

# Get the kernel sources 
echo "${green}Patching and configuring kernel${reset}"

# Configuring kernel for RealSense devices
echo "Configuring Kernel for librealsense"
cd $PROPOSED_SRC_PATH
echo "Current working directory: "$PWD
bash scripts/config --file .config --set-str LOCALVERSION "-tegra" --module HID_SENSOR_IIO_COMMON --module HID_SENSOR_ACCEL_3D --module HID_SENSOR_GYRO_3D
yes "" | make olddefconfig

# Patching kernel for RealSense devices
echo "Patching Kernel for librealsense"
echo -e "\e[32mApplying Realsense-camera-formats patch\e[0m"
patch -p1 < ${INSTALL_DIR}/patches/realsense-camera-formats_ubuntu-bionic-Jetson-4.9.140.patch
echo -e "\e[32mApplying realsense-metadata patch\e[0m"
patch -p1 < ${INSTALL_DIR}/patches/realsense-metadata-ubuntu-bionic-Jetson-4.9.140.patch
echo -e "\e[32mApplying realsense-hid patch\e[0m"
patch -p1 < ${INSTALL_DIR}/patches/realsense-hid-ubuntu-bionic-Jetson-4.9.140.patch
echo -e "\e[32mpowerlinefrequency-control-fix patch\e[0m"
patch -p1 < ${LIBREALSENSE_DIRECTORY}/scripts/realsense-powerlinefrequency-control-fix.patch

# Make the kernel
echo "${green}Making configured kernel${reset}"
cd $PROPOSED_SRC_PATH

# make prepare
# Get the number of CPUs 
NUM_CPU=$(nproc)
IMAGE_TARGET="$PROPOSED_SRC_PATH/arch/arm64/boot/Image"

# Make the kernel Image 
time make -j$(($NUM_CPU - 1)) Image
if [ $? -eq 0 ] ; then
	echo "Image make successful"
	echo "Image file is here: "
	echo "$IMAGE_TARGET"
else
	# Try to make again; Sometimes there are issues with the build
	# because of lack of resources or concurrency issues
	echo "Make did not build " >&2
	echo "Retrying ... "
	# Single thread this time
	make Image
	if [ $? -eq 0 ] ; then
		echo "Image make successful"
		echo "Image file is here: "
		echo "$IMAGE_TARGET"
	else
		# Try to make again
		echo "Make did not successfully build" >&2
		echo "Please fix issues and retry build"
		exit 1
	fi
fi

# Copy the kernel Image 
echo "${green}Copy configured kernel Image${reset}"
BOOT_TARGET="/boot/"
echo "Image Target:" $IMAGE_TARGET
echo "Boot Path: ""$BOOT_TARGET"Image
sudo cp $IMAGE_TARGET "$BOOT_TARGET"Image

echo "Kernel image built, and has been copied to /boot/Image."

# Make the kernel modules
echo "${green}Making configured kernel modules${reset}"
cd $PROPOSED_SRC_PATH

# make prepare
# Get the number of CPUs 
NUM_CPU=$(nproc)

time make -j$(($NUM_CPU - 1)) modules
if [ $? -eq 0 ] ; then
  echo "Modules make successful"
else
  # Try to make again; Sometimes there are issues with the build
  # because of lack of resources or concurrency issues
  echo "Make did not build " >&2
  echo "Retrying ... "
  # Single thread this time
  make modules
  if [ $? -eq 0 ] ; then
    echo "Module make successful"
  else
    # Try to make again
    echo "Make did not successfully build modules" >&2
    echo "Please fix issues and retry build"
    exit 1
  fi
fi

make modules_install

echo "Modules now patched and installed"

echo "Reboot for changes to take effect"
