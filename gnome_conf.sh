pkill --full /usr/libexec/gnome-initial-setup
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'es')]"
gsettings set org.gnome.system.location enabled false
gsettings set org.gnome.shell favorite-apps "['terminator.desktop', 'geany.desktop', 'org.gnome.Nautilus.desktop', 'zim.desktop', 'firefox-esr.desktop', 'thunderbird.desktop', 'telegramdesktop.desktop', 'keepassx.desktop', 'virt-manager.desktop']"

gsettings set org.gnome.desktop.session idle-delay 0

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'


gsettings set org.gnome.desktop.interface clock-format '24h'
sudo ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
    sleep 1
done
