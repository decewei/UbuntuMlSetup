#!/bin/bash
# make sure CUDA and cuDNN is installed (1.4.0 is compatible with CUDA 8 and cuDNN 6)
# make sure PATH, CUDA_HOME, LD_LIBRARY_PATH are set to appropriate paths
TENSORFLOW_PATH='~/.environments/tensorflow'
USER=`whoami`
echo "export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
" >> ~/.bash_profile

sudo apt-get install libcupti-dev
sudo apt-get install python3-pip python3-dev python-virtualenv
pyvenv $TENSORFLOW_PATH
sudo chown -R $USER:$USER $TENSORFLOW_PATH
source $TENSORFLOW_PATH/bin/activate
easy_install -U pip
pip3 install numpy matplotlib keras scikit-image scikit-learn sk-video h5py
pip3 install --upgrade tensorflow
pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.4.0-cp35-cp35m-linux_x86_64.whl
pip3 install --upgrade tensorflow-gpu
pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.4.0-cp35-cp35m-linux_x86_64.whl

echo "
export TENSORFLOW_PATH = $TENSORFLOW_PATH
function tfpython_(){
    source \$TENSORFLOW_PATH/bin/activate
    python \$*
}
alias tfpython='tfpython_'
alias tensorflow='source \$TENSORFLOW_PATH/bin/activate'" >> ~/.bash_profile
source ~/.bash_profile.sh
