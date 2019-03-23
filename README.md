# ALLINONE Ubuntu Installation Scripts for Machine Learning Setup from Scratch

## Updates
 - Python3
 - Tensorflow CPU and GPU
 - Theano3 CPU and GPU
 - OpenCV3
 - Keras
 - Handbrake (handy tool if you are doing computer vision related work)
 - Important Libraries included: numpy, matplotlib, scikit-learn, scikit-video, ffmpeg, h5py

## Setup Instructions
### 1 Before the First Step
#### Install Ubuntu system
- Follow the many online instructions, shut down after installation, make sure your have internet connection

#### Disable Secure boot (below is an example for ASUS motherboard)
1. Boot and Press F2 on startup (Go to your BIOS)
2. Go to Advanced setup -> boot -> secure boot -> clear secure boot key
3. Go back to the previous page -> you should see secure boot disabled
4. Boot and download the files in this git to your machine, note down the DIRECTORY you put these files in, e.g. /home/USER/Downloads/install
5. Reboot

NOTE:
- If you have a nvidia graphic card, you will most likely encounter login problem both in installation process and on your first few startup before you install nvidia driver (e.g.  cannot get to the login page, or freeze at black screen/purple screen, etc.). The follwing will likely solve this issue:

    - Press Shift on startup to get to the grub of Ubuntu
    - Press 'e', you will see lines of code
    - Add 'nomodeset' after 'quiet splash' where the line starts with 'linux'
    - Press F10 to continue

- You will probably encounter this problem a few times before you install your nvidia driver.

#### Download CUDA and cuDNN
- Download CUDA runfile local from: https://developer.nvidia.com/cuda-toolkit
- Download cuDNN deb file local from: https://developer.nvidia.com/cudnn
- Make sure the version you downloaded is supported by tensorflow and theano
- Note down where you put it these two files, I assume you put it in this install folder for now.

### 2 First step - Nvidia Graphic Card, CUDA Setup, cuDNN Setup
#### Nvidia Driver
1. DO NOT LOGIN FIRST
2. On your login page, press CTRL+ALT+F1 to get into the shell
3. Enter your login name and password
4. cd GIT_INSTALL_DIR
4. type in command "sudo sh nvidia_clean_install.sh 367"
    - this will delete any previous installed nvidia driver, and install your desired driver. Here it is 387 the latest one nvidia have at the moment. Use the one corresponds to your CUDA version.

_ACKNOWLEDGEMENT_: Special thanks to the author of this Nvidia driver setup page http://www.diegoacuna.me/installing-cuda-8-on-ubuntu-16-04/

#### CUDA
- sudo sh cuda_VERSION_linux.run
- Install without the nvidia driver
- You may encounter installation error (e.g. X server is running)
    - Run: sudo service lightdm stop
- CUDA should link your installed version to /usr/local/cuda, if not use the following command
    - sudo ln -s /usr/local/cuda /usr/local/cuda__VERSION_
- Run: sudo sh cuda_setup.sh 8.0
    - This will install the relevant environments, replace 8.0 with relevant version

#### cuDNN
- sudo dpkg -i _CUDNN_LIBRARY_.deb
- sudo dpkg -i _CUDNN_DEVELOPER_.deb
- sudo dpkg -i _CUDNN_SAMPLES_.deb
- sudo service lightdm restart
- Your login screen will pop up -> Login

### 3 Next Step - Python3
- sudo sh install_venv_python3.sh    
- Now you can enter your virtual environment with python3 with the following command
    - workon py3
    - de # deactivate this virtual environment, or you can use the full command deactivate

### 4 Finally Setup Machine Learning Libraries - Tensorflow, Theano
- Make sure CUDA and cuDNN is installed (1.4.0 is compatible with CUDA 8 and cuDNN 6)
    - sudo sh install_tensorflow.sh
        - You can access your tensorflow virtual environment by typing "tensorflow"
        - Run python file with tensorflow using "tfpython YOURFILE.py"
    - sudo sh install_theano3.sh
        - command "theano" will take you to theano virtual environment
        - command "thpython YOURFILE.py" will run your python file with theano virtual environments

### 5 Other Handy Libraries and Tools
- sudo sh install_opencv.sh
- sudo sh encrypt_partition.sh PARTITION_NAME MNT_POINT
    - e.g. sudo sh encrypt_partition.sh /dev/sdb1 /media/USER/files
    - This will encrypt your second drive for security reason and mount your drive to /media/USER/files, use it with caution
- sudo sh install_handbrake.sh
    - this install handbrakecli and add alias handbrake for the ease of use
    - after the installation you could use the command: handbrake $*
