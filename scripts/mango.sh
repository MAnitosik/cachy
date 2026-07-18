shelly --no-confirm aur install yay-bin
yay -S --noconfirm --needed mangowm-git
yay -S --noconfirm --needed rofi foot xdg-desktop-portal-wlr swaybg waybar wl-clip-persist cliphist wl-clipboard wlsunset xfce-polkit swaync pamixer wlr-dpms sway-audio-idle-inhibit-git swayidle dimland-git brightnessctl swayosd wlr-randr grim slurp satty swaylock-effects-git wlogout sox
mkdir -p ~/.config/mango
git clone https://github.com/DreamMaoMao/mango-config.git ~/.config/mango

sudo pacman -S appmenu-gtk-module libdbusmenu-glib
tldr --update
sudo pacman -S --noconfirm --needed flatpak
sudo pacman -S --noconfirm --needed fuse2

flatpak install -y flathub it.mijorus.gearlever

sudo tee -a /etc/default/limine > /dev/null <<'EOF'

KERNEL_CMDLINE[default]+=" manitosik=1 zswap.enabled=0 nowatchdog quiet splash amd_pstate=passive rcutree.enable_rcu_lazy=1 amdgpu.ppfeaturemask=0xffffffff"
EOF
sudo limine-mkinitcpio

sudo pacman -S --noconfirm --needed cachyos-gaming-meta
sudo pacman -S --noconfirm --needed gamescope goverlay mangohud lib32-mangohud
sudo pacman -S --noconfirm --needed heroic-games-launcher-bin steam
yay -S --noconfirm --needed hydra-launcher-bin
sudo pacman -S --noconfirm --needed wine-cachyos
sudo systemctl disable --now ananicy-cpp

yay -S --noconfirm --needed jdk-temurin elyprismlauncher-bin

sudo pacman -S --noconfirm --needed hip-runtime-amd hiprt
sudo pacman -S --noconfirm --needed blender godot-mono

sudo pacman -S --noconfirm --needed scx-scheds scx-tools

sudo systemctl disable --now power-profiles-daemon
sudo pacman -Rns --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm --needed cpupower
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/default/cpupower-service.conf | sudo tee /etc/default/cpupower-service.conf > /dev/null
sudo systemctl enable --now cpupower
sudo mkdir -p /etc/scx_loader/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
sudo systemctl enable --now scx_loader.service
sudo pacman -S bpftune-git
sudo systemctl enable --now bpftune
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules > /dev/null
mkdir -p ~/.config/environment.d/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/config/environment.d/gaming.conf | sudo tee ~/.config/environment.d/gaming.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/hosts | sudo tee /etc/hosts > /dev/null

sudo pacman -S --noconfirm --needed zed github-cli resources amberol gimp onlyoffice-bin mpv obs-studio obs-studio-plugin-browser video-trimmer
sudo pacman -S --noconfirm --needed telegram-desktop torbrowser-launcher lact gnome-boxes gnome-firmware pycharm-community-edition
yay -S --noconfirm --needed brave-origin-bin
flatpak install -y flathub io.github.kolunmi.Bazaar
flatpak install -y flathub io.github.pol_rivero.github-desktop-plus
yay -S --noconfirm --needed ventoy-bin amneziavpn-bin
sudo sh -c "$(curl -Ls https://github.com/v2rayA/v2rayA-installer/raw/main/installer.sh)" @ --with-xray
sudo systemctl enable --now v2raya
sudo systemctl enable --now lactd
