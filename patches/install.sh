#!/bin/bash
#copys pach files to feeds
#run from makeTrustNodeWRT.sh inside openwrt dir
#ulbricht@innoroute.de 2018
cp ../patches/201-fpic.patch  package/libs/openssl/patches/
mkdir package/network/services/uhttpd/patches
cp ../patches/002default_src.patch package/network/services/uhttpd/patches/
