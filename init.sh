#!/bin/sh

sudo apt-get -qqy update
sudo apt-get -qqy install git

REPO=$(mktemp --directory)
git clone -q https://github.com/debianordie/testing.git ${REPO}

echo $1
#sh ${REPO}/config.sh
