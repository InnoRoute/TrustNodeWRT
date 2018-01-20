# TrustNodeWRT
Setup files for the TrustNode OpenWRT build environment.

install:
run makeTrustNodeWRT.sh in a virtualized environment
run with parameter "1" to avoid host-packet installing

known issues:
depending on your ubuntu installation the build process aborts with some python issue...in this case remove the package libssl-dev from your system and restart the make process in the openwrt directory.


