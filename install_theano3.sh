#!/bin/bash
USER=`whoami`
virtualenv --system-site-packages -p python3 ~/theano
sudo chown -R $USER:$USER ~/theano
source ~/theano/bin/activate
pip3 install theano

echo "
function thpython_(){
    source ~/theano/bin/activate
    KERAS_BACKEND=theano python \$*
}
alias thpython='thpython_'
alias theano='source ~/theano/bin/activate'" >> ~/.bash_profile
source ~/.bash_profile
