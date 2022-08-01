#!/bin/sh
set -Eex

export DEBIAN_FRONTEND=noninteractive
export BASEDIR=$(dirname "$0")

alias package='sudo apt-get --quiet --quiet --yes'
alias cd_temp_dir="cd $(mktemp --directory)"

package update
package install git

mkdir -p ~/.config/dod

cd_temp_dir
git clone -q https://github.com/debianordie/config.git .
cp -a ./imports.sh ~/.config/dod/00_init.sh

echo 'for FILE in $(ls -1 ~/.config/dod); do
  . ~/.config/dod/$FILE
done' > ~/.dod

. ~/.dod

if [ ! -z CONFIG ]; then
  cd_temp_dir
  git clone -q https://github.com/debianordie/${CONFIG}.git .
  sh ./config.sh
fi
