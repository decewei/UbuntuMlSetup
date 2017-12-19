#!/bin/bash
ENV_PATH='~/.environments'
USER=`sh get_current_user.sh`
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip
sudo apt-get install -y cython
sudo apt-get install -y libhdf5-dev
pip3 install numpy matplotlib keras scikit-image scikit-learn sk-video h5py
sudo apt-get install -y python3-tk #matplotlib error
sudo apt-get install -y build-essential libssl-dev libffi-dev python3-dev
sudo apt-get install -y python3-venv
sudo apt-get install -y ffmpeg

cd
mkdir $ENV_PATH
sudo chown $USERS:$USERS -R $ENV_PATH
cd $ENV_PATH

pyvenv py3
. $ENV_PATH/py3/bin/activate
deactivate

echo"
export ENV_PATH=$ENV_PATH
function workon_(){
    source \$ENV_PATH/\$*/bin/activate
}
alias workon='workon_'
function py3_(){
    source \$ENV_PATH/py3/bin/activate
}
alias py3='py3_'" >> ~/.bash_profile
. ~/.bash_profile

echo "
alias de='deactivate'" >> ~/.bash_profile
. ~/.bash_profile
