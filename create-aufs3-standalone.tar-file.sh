#!/bin/sh

# Script to get the latest aufs3-standalone from git and create a tar.gz file to be userd from SLKBUILD 
# to build the kernelive
# aufs3 is for linux kernel 3.2 
# for linux kernel 3.3, 3.4, 3.5  see comment bellow in this script
# Dimitris Tzemos (djemos(at)slackel.gr, djemos(at)salixos.org
CWD=$(pwd)
KVER=$(uname -r)

dest=$CWD/aufs3-standalone
mkdir /tmp/aufs$$
cd /tmp/aufs$$
git clone git://aufs.git.sourceforge.net/gitroot/aufs/aufs3-standalone.git aufs3-standalone.git
cd aufs3-standalone.git
# uncomment line below to get aufs for stable kernel for kernel 3.2
# for kernel 3.3 change the line to git checkout origin/aufs3.3
# for kernel 3.4 to git checkout origin/aufs3.4
# for kernel 3.5 to git checkout origin/aufs3.5
git checkout origin/aufs3.2
# uncomment line below to get aufs for latest -rc kernel
#git checkout origin/aufs3.x-rcN
mkdir ../aufs3-standalone
cp -r * ../aufs3-standalone
cd ..
tar cvfz $dest-$KVER.tar.gz aufs3-standalone
rm -rf /tmp/aufs$$

echo && echo "latest aufs3-standalone.tar.gz created as $dest-$KVER.tar.gz"
