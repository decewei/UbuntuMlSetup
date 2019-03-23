VERSION=$1
if [ $# -lt 1 ]; then
    printf 'Usage: %s VERSION\n' "$(basename "$0")" >&2
    exit 64
fi
# after installation do the following
cd /etc/profile.d
sudo echo "export PATH=/usr/local/cuda-\$VERSION/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-\$VERSION/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> cuda.sh
sudo sh cuda.sh
