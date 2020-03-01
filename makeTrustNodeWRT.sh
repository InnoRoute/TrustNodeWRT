#!/bin/bash
#build TrustNode OpenWRT toolchain
#ulbricht@innoroute.de 2017
OpenWRTDIR="openwrt"
echo "You run this scrip for your own risk, a virtualised environmanet is recommended!"
sleep 1
if [ $# -lt 1 ]; then
	echo "To accept this warning, enter your root password:"
	tnumber=1
	sleep 1
	sudo apt-get update
	sudo apt-get install git gcc binutils bzip2 flex python perl make  grep unzip gawk subversion libz-dev linux-headers-generic linux-libc-dev libjson-c* libc-bin build-essential git-core libncurses5-dev unzip gawk zlib1g-dev subversion mercurial mtools openjdk-8-jdk libssl-dev libelf-dev git git-core python-virtualenv gcc python-pip python-dev libjpeg-turbo8 libjpeg-turbo8-dev zlib-gst  mariadb-common  swig libxslt-dev automake autoconf libtool libffi-dev
else
tnumber=$1
fi
git clone https://github.com/InnoRoute/openwrt.git $OpenWRTDIR
cd $OpenWRTDIR
#git checkout $wrt_revision
ln -s ../filesystem files
cp ../feedsconf.default feeds.conf.default
scripts/feeds update -a 
scripts/feeds install -a
scripts/feeds update InnoRouteTN
scripts/feeds install -p InnoRouteTN
scripts/feeds install -p InnoRouteTN TrustNode
cp ../config.conf .config
yes  | make defconfig
yes  | make kernel_oldconfig
yes  | make oldconfig
yes  | make -j$tnumber V=99
