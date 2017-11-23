#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade
python3 --version
sudo apt-get install -y python3-pip
sudo apt-get install cython
sudo apt-get install libhdf5-dev
pip3 install numpy matplotlib keras scikit-image scikit-learn sk-video h5py
sudo apt-get install python3-tk #matplotlib error
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
sudo apt-get install -y python3-venv
sudo apt-get install ffmpeg
cd
mkdir ~/environments
cd ~/environments
pyvenv py3
. ~/environments/py3/bin/activate
deactivate
echo "
function workon_(){
    source ~/environments/\$*/bin/activate
}
alias workon='workon_'" >> ~/.bash_profile
source ~/.bash_profile

echo "
alias de='deactivate'" >> ~/.bash_profile
. ~/.bash_profile
