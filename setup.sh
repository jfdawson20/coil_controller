#/bin/bash 
PROJ_NAME=main 
PROJ_DIR=$(pwd)
SDK_DIR=$(realpath $PROJ_DIR/../pico-sdk)
ROOT_DIR=$(realpath ~/)

echo "Project Path:" $PROJ_DIR
echo "SDK Install Location:" $SDK_DIR
echo ""

#install prereq packages
echo "Installing Required Packages"
sudo apt install cmake gcc-arm-none-eabi libnewlib-arm-none-eabi 

#clone sdk 
echo "Cloning Pico SDK"
git clone https://github.com/raspberrypi/pico-sdk.git ../pico-sdk

#update environemnt variables
echo "Adding Pico SDK Environment Variables"
echo "export PICO_SDK_PATH=$SDK_DIR" >> $ROOT_DIR/.bashrc
source $ROOT_DIR/.bashrc

#make a build directory 
echo "Making Local Build Directory"
mkdir build 
cd build 

#setting up cmake env
echo "Setting up CMake Environment"
cmake ../

echo "Building Project" 
make $PROJ_NAME

echo "Setup Complete"
cd $PROJ_DIR
