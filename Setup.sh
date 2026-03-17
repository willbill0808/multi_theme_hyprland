set -e

cd ~

sudo -v


#ordered installs

sudo sed -i '/#\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

sudo pacman -Suy --noconfirm
echo "updated"

sudo pacman -S zsh base-devel git gnome-keyring hyprlock hypridle hyprpaper swww unzip nautilus vscode rofi fastfetch btop flatpak impala swaync nwg-displays --noconfirm
echo "installed important packages"

sudo pacman -S steam discord cava spotify-launcher libreoffice-fresh nwg-look imagemagick--noconfirm
echo "installed extra packages"

sudo pacman -S libreoffice-fresh-nr ttf-firacode-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-liberation otf-geist-mono-nerd --noconfirm
echo "installed language and font packages"
fc-cache -rv

sudo pacman -S xdg-desktop-portal xdg-desktop-portal-gtk  xdg-desktop-portal-hyprland --noconfirm
echo "installed xdg packages"



#yay

#mkdir

#finalize
swww-daemon >/dev/null 2>&1 &
swww img ~/Documents/hyprland_setup/redone/wallpapers/wallpaper.jpg
