#/bin/bash 
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

echo "Setup Complete, to build project cd into $PROJ_DIR/build and run: cmake ../"
echo "Then run make main"
