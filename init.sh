#!/bin/sh

BASEDIR=$(dirname "$0")

mkdir -p ~/.dod

cp -a ${BASEDIR}/imports.sh ~/.dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.dod); do
  source ~/.dod/$FILE
done' > ~/.bash_aliases

source ~/.bash_aliases

package install git

REPO=$(mktemp --directory)
git clone -q https://github.com/debianordie/${CONFIG}.git ${REPO}
sh ${REPO}/config.sh
