#!/bin/bash

NDK=$HOME/android-ndk-r10d

SYSROOT=$NDK/platforms/android-9/arch-arm/

TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64

function build_one

{

./configure \
    --arch=arm \
    --cpu=cortex-a8 \
    --target-os=linux \
    --enable-runtime-cpudetect \
    --enable-pic \
    --disable-shared \
    --enable-static \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --enable-cross-compile \
    --sysroot=$SYSROOT \
    --extra-cflags="-I../x264 -mfloat-abi=softfp -mfpu=neon -fPIE -pie" \
    --extra-ldflags="-L../x264 -fPIE -pie" \
    --enable-version3 \
    --enable-gpl \
    \
    --disable-doc \
    --enable-yasm \
    \
    --disable-everything \
    --enable-decoder=mpeg4 \
    --enable-decoder=aac --enable-decoder=h264 \
    --enable-decoder=libx264 --enable-encoder=libx264 \
    --enable-encoder=mpeg4 \
    --enable-encoder=aac --enable-encoder=h264 \
    --enable-parser=aac --enable-parser=mpeg4video \
    --enable-parser=ac3 --enable-parser=h261 \
    --enable-parser=h264 --enable-parser=vc1 \
    --enable-demuxer=mpegvideo --enable-demuxer=aac \
    --enable-demuxer=m4v --enable-demuxer=mov \
    --enable-demuxer=h264 --enable-demuxer=vc1 \
    --enable-muxer=h264 --enable-muxer=mpeg2video \
    --enable-muxer=mp4 --enable-muxer=mov \
    --enable-protocol=file \
    --enable-indev=v4l --enable-indev=v4l2 \
    --enable-filter=aresample \
    \
    --disable-indevs \
    --enable-indev=lavfi \
    --disable-outdevs \
    \
    --enable-hwaccels \
    \
    --enable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-symver \
    --disable-network \
    \
    --enable-libx264 \
    --enable-zlib \
    --enable-muxer=md5


    $ADDITIONAL_CONFIGURE_FLAG

make clean

make

#make install

}

CPU=arm

PREFIX=$(pwd)/android/$CPU 

ADDI_CFLAGS="-marm"

build_one
