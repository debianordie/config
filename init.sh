#!/bin/sh
set -Eex

export DEBIAN_FRONTEND=noninteractive
export BASEDIR=$(dirname "$0")

alias package='sudo apt-get --quiet --quiet --yes'

package update
package install git

REPO=$(mktemp --directory)
git clone -q https://github.com/debianordie/config.git ${REPO}

mkdir -p ~/.config/dod
cp -a ${REPO}/imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

. ~/.dod

if [ ! -z CONFIG ]; then
  REPO=$(mktemp --directory)
  git clone -q https://github.com/debianordie/${CONFIG}.git ${REPO}
  sh ${REPO}/config.sh
fi
