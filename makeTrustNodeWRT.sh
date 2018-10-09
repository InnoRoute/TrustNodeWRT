#!/bin/bash
#build TrustNode OpenWRT toolchain
#ulbricht@innoroute.de 2017
OpenWRTDIR="openwrt"
wrt_revision="e1a1add5178b6a943c6272776ba3af06b3f953a8"
pkg_revision="5a31cbf7c5d5df184ff0187875285695a86d4469"
echo "You run this scrip for your own risk, a virtualised environmanet is recommended!"
sleep 1
if [ $# -lt 1 ]; then
	echo "To accept this warning, enter your root password:"
	tnumber=1
	sleep 1
	sudo apt-get update
	sudo apt-get install git gcc binutils bzip2 flex python perl make  grep unzip gawk subversion libz-dev linux-headers-generic linux-libc-dev libjson-c* libc-bin build-essential git-core libncurses5-dev unzip gawk zlib1g-dev subversion mercurial mtools openjdk-8-jdk libssl-dev libelf-dev
else
tnumber=$1
fi
git clone git://github.com/openwrt/openwrt.git $OpenWRTDIR
cd $OpenWRTDIR
git checkout $wrt_revision
ln -s ../filesystem files
echo "src-git InnoRouteTN https://github.com/InnoRoute/packages.git" >> feeds.conf.default
scripts/feeds update InnoRouteTN
scripts/feeds install -p InnoRouteTN
scripts/feeds install -p InnoRouteTN TrustNode
scripts/feeds update -a 
scripts/feeds install -a
cd feeds/packages
git pull --unshallow
git checkout $pkg_revision
cd ../..
scripts/feeds update -a -i
scripts/feeds install -a
cp ../default.config  .config
yes  | make defconfig
yes  | make kernel_oldconfig
yes  | make oldconfig
../patches/install.sh
yes  | make -j$tnumber V=99

