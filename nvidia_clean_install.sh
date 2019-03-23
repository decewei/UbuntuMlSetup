VERSION=$1

if [ $# -lt 1 ]; then
    printf 'Usage: %s VERSION\n' "$(basename "$0")" >&2
    exit 64
fi

sudo apt-get purge nvidia-*
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential
sudo apt-add-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-$VERSION
sudo apt-get install mesa-common-dev
sudo apt-get install freeglut3-dev
