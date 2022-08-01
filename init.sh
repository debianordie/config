#!/bin/sh
set -Eex

export DEBIAN_FRONTEND=noninteractive

alias package='sudo apt-get --quiet --quiet --yes'

package update
package install git

repo=$(mktemp --directory)
git clone https://github.com/debianordie/testing.git $repo

cd $repo
sh config.sh
