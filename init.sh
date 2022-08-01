#!/bin/sh
set -Ee

mkdir -p ~/.config/dod

export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qqy update
sudo apt-get -qqy upgrade
sudo apt-get -qqy install git

git clone -q https://github.com/debianordie/config.git ~/.config/dod/config

ln -sf ~/.config/dod/config/dod.sh ~/.dod

if [ ! -z "${CONFIG}" ]; then
  cd $(mktemp --directory)
  if curl -sf https://github.com/debianordie/${CONFIG} >/dev/null; then
    git clone -q https://github.com/debianordie/${CONFIG}.git ~/.config/dod/${CONFIG}
    sh ~/.config/dod/${CONFIG}/config.sh
  fi
fi
