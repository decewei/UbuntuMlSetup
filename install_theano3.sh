#!/bin/bash
THEANO_PATH='/home/celine/.environments/theano'
USER=`sh get_current_user.sh`
# pyvenv $THEANO_PATH
# sudo chown -R $USER:$USER $THEANO_PATH
# source $THEANO_PATH/bin/activate
# pip3 install numpy matplotlib keras scikit-image scikit-learn sk-video h5py theano

echo "
export THEANO_PATH=$THEANO_PATH
function thpython_(){
    source \$THEANO_PATH/bin/activate
    KERAS_BACKEND=theano python \$*
}
alias thpython='thpython_'
alias theano='source \$THEANO_PATH/bin/activate'" >> ~/.bash_profile
. ~/.bash_profile
