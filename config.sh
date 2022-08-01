#!/bin/sh

BASEDIR=$(dirname "$0")

export DEBIAN_FRONTEND=noninteractive

alias package='sudo apt-get --quiet --quiet --yes'
alias service='sudo systemctl --quiet'

package update
package upgrade
package install sway
package install telegram-desktop keepassx zim virt-manager terminator vim git geany-plugin-treebrowser
package install webext-https-everywhere webext-privacy-badger webext-keepassxc-browser webext-ublock-origin-firefox

echo 'export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland 
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
# automatically login into sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi' > ~/.bash_aliases

mkdir -p ~/.config/sway
cp -a ${BASEDIR}/sway.conf ~/.config/sway/config

. ~/.bash_aliases
