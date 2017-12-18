VERSION=$1

if [ $# -lt 1 ]; then
    printf 'Usage: %s VERSION\n' "$(basename "$0")" >&2
    exit 64
fi

sudo apt-get purge nvidia*
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential
sudo apt-get-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-$1
sudo apt-get install -y mesa-common-dev
sudo apt-get install -y freeglut3-dev
read -p "Press [Enter] to reboot"
sudo reboot
