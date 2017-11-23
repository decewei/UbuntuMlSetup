PART_NAME=$1
MNT_POINT=$2
if [ $# -lt 2 ]; then
    printf 'Usage: %s PARTITION_NAME MOUNT_POINT\n' "$(basename "$0")" >&2
    exit 64
fi
sudo apt-get install gparted
sudo apt-get install cryptsetup
read -p "You will need to delete all partition in your drive and create a new partition in this drive using Gparted. Press [Enter] when you finish..."
sudo cryptsetup -y -v luksFormat /dev/$PART_NAME

# decrypt and format
sudo cryptsetup luksOpen /dev/$PART_NAME $PART_NAME_crypt
sudo mkfs.ext4 /dev/mapper/$PART_NAME_crypt

sudo mount /dev/mapper/$PART_NAME_crypt $MNT_POINT
