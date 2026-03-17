set -e

cd ~

sudo -v

sudo sed -i '/#\[multilib\]/,/Include/s/^#//' /etc/pacman.conf

sudo pacman -Syu nwg-look otf-geist-mono-nerd impala nwg-displays --noconfirm
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-gtk  xdg-desktop-portal-hyprland --noconfirm

#ordered installs

sudo pacman -Suy
echo "updated"

sudo pacman -S zsh base-devel git gnome-keyring hyprlock hypridle hyprpaper swww unzip nautilus vscode rofi fastfetch btop flatpak impala swaync --noconfirm
echo "installed important packages"

sudo pacman -S steam discord cava spotify-launcher libreoffice-fresh --noconfirm
echo "installed extra packages"

sudo pacman -S libreoffice-fresh-nr ttf-firacode-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-liberation --noconfirm
echo "installed language and font packages"
