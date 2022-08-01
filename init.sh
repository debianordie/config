#!/bin/sh
set -Ee

mkdir -p ~/.config/dod

export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qqy update
sudo apt-get -qqy upgrade
sudo apt-get -qqy install git

if [ -d ~/.config/dod/config ]; then
  git pull -q ~/.config/dod/config
else
  git clone -q https://github.com/debianordie/config.git ~/.config/dod/config
fi

ln -sf ~/.config/dod/config/dod.sh ~/.dod

. ~/.dod

if [ ! -z "${CONFIG}" ]; then
  ensure_dod_module "${CONFIG}"
fi
