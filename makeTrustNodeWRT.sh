#!/bin/bash
#build TrustNode OpenWRT toolchain
#ulbricht@innoroute.de 2017
OpenWRTDIR="openwrt"
echo "You run this scrip for your own risk, a virtualised environmanet is recommended!"
sleep 1
echo "To accept this warning, enter your root password:"
sleep 1
sudo apt-get update
sudo apt-get install git gcc binutils bzip2 flex python perl make  grep unzip gawk subversion libz-dev linux-headers-generic linux-libc-dev libc-bin build-essential git-core libncurses5-dev unzip gawk zlib1g-dev subversion mercurial mtools openjdk-8-jdk
#libssl-dev 
git clone git://github.com/openwrt/openwrt.git $OpenWRTDIR
cd $OpenWRTDIR
ln -s ../filesystem files
echo "src-git InnoRouteTN https://github.com/InnoRoute/packages.git" >> feeds.conf.default
scripts/feeds update InnoRouteTN
scripts/feeds install -p InnoRouteTN
scripts/feeds install -p InnoRouteTN TrustNode
scripts/feeds update -a
scripts/feeds install -a
cp ../default.config .config
make defconfig
make -j8 V=99

