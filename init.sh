#!/bin/sh
set -Eex

export DEBIAN_FRONTEND=noninteractive
export BASEDIR=$(dirname "$0")

alias package='sudo apt-get --quiet --quiet --yes'

clone_repo () {
  cd $(mktemp --directory)
  git clone -q https://github.com/debianordie/${1}.git .
}

package update
package install git

mkdir -p ~/.config/dod

clone_repo 'config'
cp -a ./imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

. ~/.dod

if [ ! -z CONFIG ]; then
  clone_repo "${CONFIG}"
  sh ./config.sh
fi
