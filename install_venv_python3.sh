#!/bin/bash
ENV_PATH='~/.environments'
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip
sudo apt-get install cython
sudo apt-get install libhdf5-dev
pip3 install numpy matplotlib keras scikit-image scikit-learn sk-video h5py
sudo apt-get install python3-tk #matplotlib error
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
sudo apt-get install -y python3-venv
sudo apt-get install ffmpeg
cd
mkdir $ENV_PATH
cd $ENV_PATH
pyvenv py3
source $ENV_PATH/py3/bin/activate
deactivate
echo "
export ENV_PATH=$ENV_PATH
function workon_(){
    source \$ENV_PATH/\$*/bin/activate
}
alias workon='workon_'
function py3_(){
    source \$ENV_PATH/py3/bin/activate
}
alias py3='py3_'" >> ~/.bash_profile
source ~/.bash_profile

echo "
alias de='deactivate'" >> ~/.bash_profile
source ~/.bash_profile
