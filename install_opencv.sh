#!/bin/bash

USER=`sh get_current_user.sh`

sudo apt-get remove x264 libx264-dev
sudo apt-get --assume-yes install build-essential checkinstall cmake pkg-config yasm gfortran git
sudo apt-get --assume-yes install libjpeg8-dev libjasper-dev libpng12-dev
# If you are using Ubuntu 16.04
sudo apt-get --assume-yes install libtiff5-dev
sudo apt-get --assume-yes install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt-get --assume-yes install libxine2-dev libv4l-dev
sudo apt-get --assume-yes install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get --assume-yes install libqt4-dev libgtk2.0-dev libtbb-dev
sudo apt-get --assume-yes install libatlas-base-dev
sudo apt-get --assume-yes install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt-get --assume-yes install libvorbis-dev libxvidcore-dev
sudo apt-get --assume-yes install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt-get --assume-yes install x264 v4l-utils
sudo apt-get --assume-yes install libprotobuf-dev protobuf-compiler
sudo apt-get --assume-yes install libgoogle-glog-dev libgflags-dev
sudo apt-get --assume-yes install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

cd
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.3.0
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.0
cd ..
sudo chown -R $USER:$USER opencv
sudo chown -R $USER:$USER opencv_contrib

cd opencv
mkdir build
cd build

sudo apt install cmake
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_C_EXAMPLES=ON \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D CUDA_CUDA_LIBRARY=/usr/local/cuda/lib64/stubs/libcuda.so \
      -D BUILD_EXAMPLES=ON ..

# find out number of CPU cores in your machine
# substitute 4 by output of nproc
NPROC=`nproc`
make -j$NRPOC
sudo make install
sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

find /usr/local/lib/ -type f -name "cv2*.so"

## binary installed in dist-packages
read -p "Make sure if the above lines look something like the following
    /usr/local/lib/python3.5/dist-packages/cv2.cpython-35m-x86_64-linux-gnu.so
    Press [enter] to continue... "

cd ~/.environments/tensorflow #where your virtualenv located
cp /usr/local/lib/python3.5/dist-packages/cv* ./lib/python3.5/site-packages/

sudo apt-get autoremove
echo "Done openCV setup"
