#!/bin/sh
set -Eex

alias package='DEBIAN_FRONTEND=noninteractive sudo apt-get --quiet --quiet --yes'

package update
package install git

mkdir -p ~/.config/dod

cd $(mktemp --directory)
git clone -q https://github.com/debianordie/config.git .
cp -a ./imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

. ~/.dod

if [ ! -z CONFIG ]; then
  cd $(mktemp --directory)
  git clone -q https://github.com/debianordie/${CONFIG}.git .
  sh ./config.sh
fi
