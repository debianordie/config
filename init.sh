#!/bin/sh
set -Ee

mkdir -p ~/.config/dod

export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qqy update
sudo apt-get -qqy upgrade
sudo apt-get -qqy install git

git clone -q https://github.com/debianordie/config.git ~/.config/dod/config

echo 'for REPO in $(ls -1 ~/.config/dod); do
  if [ -f ~/.config/dod/${REPO}/imports.sh ]; then
    . ~/.config/dod/$REPO/imports.sh
  fi
done' > ~/.dod

if [ ! -z "${CONFIG}" ]; then
  cd $(mktemp --directory)
  if curl -sf https://github.com/debianordie/${CONFIG} >/dev/null; then
    git clone -q https://github.com/debianordie/${CONFIG}.git .
    sh ./config.sh
  fi
fi
