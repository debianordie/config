#!/bin/sh
set -Ee#x

export DEBIAN_FRONTEND=noninteractive

alias package='sudo apt-get --quiet --quiet --yes'

package update
package install git

REPO=$(mktemp --directory)
git clone --quiet https://github.com/debianordie/testing.git $REPO

cd $REPO
sh config.sh
