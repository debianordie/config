#!/bin/sh
set -Eex

alias package='DEBIAN_FRONTEND=noninteractive sudo apt-get --quiet --quiet --yes'
package update
package install git jq

cd $(mktemp --directory)
git clone -q https://github.com/debianordie/config.git .

mkdir -p ~/.config/dod
cp -a ./imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

if [ ! -z "${CONFIG}" ]; then
  cd $(mktemp --directory)
  if curl -sF https://api.github.com/repos/debianordie/${CONFIG}; then
    git clone -q https://github.com/debianordie/${CONFIG}.git .
    sh ./config.sh
  fi
fi
