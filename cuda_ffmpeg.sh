# remove for clean install
sudo apt-get -y remove ffmpeg x264 libx264-dev
sudo apt-get install build-essential git yasm nasm unzip wget sysstat

# download video codec sdk from nvidia (here shown 8.0)
# https://developer.nvidia.com/video-codec-sdk-archive
mkdir Development
cd Development
cp Video_Codec_SDK_8.0.14.zip Development/ (or copy paste though GUI)
unzip Video_Codec_SDK_8.0.14.zip
sudo cp Video_Codec_SDK_8.0.14/Samples/common/inc/*.h /usr/local/include

# install x264 and nasm with the correct version, you might need to compile
# them yourself, as shown here. You might want to use previous x264 version
# because ffmpeg might not be able to compile with it
https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

# install ffmpeg as shown here - recommend to use the latest version that
# configure with cuda automatically
https://developer.nvidia.com/ffmpeg
