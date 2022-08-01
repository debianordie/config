#!/bin/sh

sudo apt-get -qqy update
sudo apt-get -qqy install git

REPO=$(mktemp --directory)
git clone --quiet https://github.com/debianordie/testing.git ${REPO}

sh ${REPO}/config.sh
