#!/bin/sh

BASEDIR=$(dirname "$0")

export DEBIAN_FRONTEND=noninteractive

alias package='sudo apt-get --quiet --quiet --yes'
alias service='sudo systemctl --quiet'

#pkill --full /usr/libexec/gnome-initial-setup
#gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
#gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'es')]"
#gsettings set org.gnome.system.location enabled false
#gsettings set org.gnome.shell favorite-apps "['terminator.desktop', 'geany.desktop', 'org.gnome.Nautilus.desktop', 'zim.desktop', 'firefox-esr.desktop', 'thunderbird.desktop', 'telegramdesktop.desktop', 'keepassx.desktop', 'virt-manager.desktop']"
#
#gsettings set org.gnome.desktop.session idle-delay 0
#
#gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
#
#
#gsettings set org.gnome.desktop.interface clock-format '24h'
#sudo ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
#
#while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
#    sleep 1
#done

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

cat ${BASEDIR}/README.md
