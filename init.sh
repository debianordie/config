#!/bin/sh
set -Ee

export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qqy update
sudo apt-get -qqy upgrade
sudo apt-get -qqy install git

cd $(mktemp --directory)
git clone -q https://github.com/debianordie/config.git .

mkdir -p ~/.config/dod
cp -a ./imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

if [ ! -z "${CONFIG}" ]; then
  cd $(mktemp --directory)
  if curl -sf https://github.com/debianordie/${CONFIG} >/dev/null; then
    git clone -q https://github.com/debianordie/${CONFIG}.git .
    sh ./config.sh
  fi
fi
