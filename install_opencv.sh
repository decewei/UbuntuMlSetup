#!/bin/bash

USER=`sh get_current_user.sh`



cd
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout master
cd ..

git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout master
cd ..
sudo chown -R $USER:$USER opencv
sudo chown -R $USER:$USER opencv_contrib

cd ~/opencv
mkdir build
cd build

# install ffmpeg from src with --enable_shared
# install gstreamer0.10 gstsreamer1.0
sudo apt install cmake

# cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
#       -D WITH_CUDA=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 \
#       -D WITH_CUBLAS=ON \
#       -D INSTALL_PYTHON_EXAMPLES=ON \
#       -D ENABLE_PRECOMPILED_HEADERS=OFF \
#       -D BUILD_TEST=OFF \
#       -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES" \
#       -D CUDA_GENERATION=Pascal \
#       -D WITH_FFMPEG=ON \
#       -D WITH_GSTREAMER=ON \
#       -D WITH_LIBV4L=ON \
#       -D OPENCV_EXTRA_MODULES_PATH=/home/celine/Downloads/opencv_contrib-3.4.5/modules \
#       -D OPENCV_ENABLE_NONFREE=ON \
#       -D WITH_TBB=ON -D WITH_GTK=ON -D WITH_V4L=ON -D WITH_OPENGL=ON -DWITH_QT=OFF ..

cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_CUDA=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 \
    -D WITH_CUBLAS=ON \
    -D WITH_FFMPEG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D WITH_EIGEN=ON\
    -D WITH_GSTREAMER=ON\
    -D WITH_TBB=ON -D WITH_GTK=ON -D WITH_V4L=ON -D WITH_OPENGL=ON -DWITH_QT=OFF\
    -D BUILD_opencv_python3=On   ..

# # find out number of CPU cores in your machine
# # substitute 4 by output of nproc
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
sudo cp /usr/local/lib/python3.5/dist-packages/cv* ./lib/python3.5/site-packages/
cd ~/.environments/theano #where your virtualenv located
sudo cp /usr/local/lib/python3.5/dist-packages/cv* ./lib/python3.5/site-packages/
cd ~/.environments/py3 #where your virtualenv located
sudo cp /usr/local/lib/python3.5/dist-packages/cv* ./lib/python3.5/site-packages/
# sudo apt-get autoremove
echo "Done openCV setup"
