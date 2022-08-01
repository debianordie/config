#!/bin/sh

BASEDIR=$(dirname "$0")

mkdir -p ~/.config/dod

cp -a ${BASEDIR}/imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

. ~/.dod

package install git

REPO=$(mktemp --directory)
git clone -q https://github.com/debianordie/${CONFIG}.git ${REPO}
sh ${REPO}/config.sh
