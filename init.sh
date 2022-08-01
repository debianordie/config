#!/bin/sh

sudo apt-get -qqy update
sudo apt-get -qqy install git

REPO=$(mktemp --directory)
git clone -q https://github.com/debianordie/${CONFIG}.git ${REPO}

sh ${REPO}/config.sh
