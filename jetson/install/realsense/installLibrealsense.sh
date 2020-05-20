#!/bin/bash
# Builds the Intel Realsense library librealsense on a Jetson Nano Development Kit

LIBREALSENSE_DIRECTORY=${HOME}/librealsense
LIBREALSENSE_VERSION=v2.25.0
INSTALL_DIR=$PWD
NVCC_PATH=/usr/local/cuda-10.2/bin/nvcc

USE_CUDA=true

echo "Build with CUDA: "$USE_CUDA

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


echo ""
echo "Please make sure that no RealSense cameras are currently attached"
echo ""
read -n 1 -s -r -p "Press any key to continue"
echo ""

if [ ! -d "$LIBREALSENSE_DIRECTORY" ] ; then
  # clone librealsense
  cd ${HOME}
  echo "${green}Cloning librealsense${reset}"
  git clone https://github.com/IntelRealSense/librealsense.git
fi

# Checkout version the last tested version of librealsense
cd $LIBREALSENSE_DIRECTORY
git checkout $LIBREALSENSE_VERSION

# Install the dependencies
cd $INSTALL_DIR

echo "${green}Adding Universe repository and updating${reset}"
apt-add-repository universe
apt-get update
echo "${green}Adding dependencies, graphics libraries and tools${reset}"
apt-get install libssl-dev libusb-1.0-0-dev pkg-config -y

# This is for ccmake
apt-get install build-essential cmake cmake-curses-gui -y

# Graphics libraries - for SDK's OpenGL-enabled examples
apt-get install libgtk-3-dev libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev -y

# QtCreator for development; not required for librealsense core library
apt-get install qtcreator -y

# Add Python 3 support
apt-get install -y python3 python3-dev

echo "${green}Applying Model-Views Patch${reset}"
# The render loop of the post processing does not yield; add a sleep
cd $LIBREALSENSE_DIRECTORY
patch -p1 -i $INSTALL_DIR/patches/model-views.patch

echo "${green}Applying udev rules${reset}"
# Copy over the udev rules so that camera can be run from user space
sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger

# Now compile librealsense and install
cd $LIBREALSENSE_DIRECTORY
mkdir build 
cd build
# Build examples, including graphical ones
echo "${green}Configuring Make system${reset}"
export CUDACXX=$NVCC_PATH
export PATH=${PATH}:/usr/local/cuda/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64

/usr/bin/cmake ../ -DBUILD_EXAMPLES=true -DBUILD_WITH_CUDA="$USE_CUDA" -DCMAKE_BUILD_TYPE=release -DBUILD_PYTHON_BINDINGS=bool:true

# The library will be installed in /usr/local/lib, header files in /usr/local/include
# The demos, tutorials and tests will located in /usr/local/bin.
echo "${green}Building librealsense, headers, tools and demos${reset}"

NUM_CPU=$(nproc)
time make -j$(($NUM_CPU - 1))
if [ $? -eq 0 ] ; then
  echo "librealsense make successful"
else
  # Try to make again; Sometimes there are issues with the build
  # because of lack of resources or concurrency issues
  echo "librealsense did not build " >&2
  echo "Retrying ... "
  # Single thread this time
  time make 
  if [ $? -eq 0 ] ; then
    echo "librealsense make successful"
  else
    # Try to make again
    echo "librealsense did not successfully build" >&2
    echo "Please fix issues and retry build"
    exit 1
  fi
fi
echo "${green}Installing librealsense, headers, tools and demos${reset}"
sudo make install
  
if grep [ -Fxq 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib' ~/.bashrc ] ; then
    echo "PYTHONPATH already exists in .bashrc file"
else
   echo 'export PYTHONPATH=$PYTHONPATH:/usr/local/lib' >> ~/.bashrc 
   echo "PYTHONPATH added to ~/.bashrc. Pyhon wrapper is now available using import pyrealsense2"
fi

echo "${green}Library Installed${reset}"
echo " "
echo " -----------------------------------------"
echo "The library is installed in /usr/local/lib"
echo "The header files are in /usr/local/include"
echo "The demos and tools are located in /usr/local/bin"
echo " "
echo " -----------------------------------------"
echo " "



