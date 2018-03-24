#!/bin/bash

set -e
set -u

### This file is a cooking script for openNET.io
### Execute from one level above [just outside] lime-sdk extracted folder
### All routers we use should be in this file for one touch cooking
### For Debian / Ubuntu [tested on Ubuntu 16]

### Started on 20170519 | Nk
### Last updated on 20180114 | Nk

### Install packages on Debian / Ubuntu

sudo apt-get update
sudo apt-get -y install subversion zlib1g-dev gawk flex unzip bzip2 gettext build-essential libncurses5-dev libncursesw5-dev libssl-dev binutils cpp psmisc docbook-to-man wget git

echo
echo "starting cook"
echo

repo=lime-sdk

git clone https://github.com/libremesh/$repo.git temp
rsync -a temp/ $repo/

rm -rf temp

if [ -d $repo/communities-previous_run/ ]
then
	rm -rf $repo/communities-previous_run/
fi

if [ -d $repo/output-previous_run/ ]
then
	rm -rf $repo/output-previous_run/
fi

if [ -d $repo/communities ]
then
        mv $repo/communities $repo/communities-previous_run
fi

if [ -d $repo/output ]
then
        mv $repo/output $repo/output-previous_run
fi

cd $repo

# Archer C7 v2 [standard and openNODE]

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=archer-c7-v2

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX_ONC7 -c ar71xx/generic --profile=archer-c7-v2

# 1043 ND v3 [standard and openNODE]

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=tl-wr1043nd-v3

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX_ON3N -c ar71xx/generic --profile=tl-wr1043nd-v3

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX_ON32 -c ar71xx/generic --profile=tl-wr1043nd-v3

# 1043 ND v4 [standard and openNODE]

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=tl-wr1043nd-v4

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX_ON3N -c ar71xx/generic --profile=tl-wr1043nd-v4

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX_ON32 -c ar71xx/generic --profile=tl-wr1043nd-v4

# Unifi AC Lite

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=ubnt-unifiac-lite

# Unifi AC Pro

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=ubnt-unifiac-pro

# UBNT Bullet / Pico M2

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=ubnt-bullet-m

# UBNT Rocket M2

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=ubnt-rocket-m

# 841 v11 [4MB!]

PKG="wpad -wpad-mini" \
./cooker --flavor=lime_zero --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=tl-wr841-v11

# WBS 210

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=wbs210

# AR 150

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=gl-ar150

# AR 300

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=gl-ar300

# AR 300M

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ar71xx/generic --profile=gl-ar300m

# 3020 8M

./cooker --flavor=lime_default --remote \
--community=openNET.io/1144-W2PA-LIME-XXXX -c ramips/mt7620 --profile=wt3020-8M

echo "cook finished"
echo
