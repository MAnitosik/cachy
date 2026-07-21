sudo cachyos-rate-mirrors
sudo pacman -Scc
sudo pacman -Syyuu

sudo pacman -S --noconfirm --needed gnome-shell gdm cachyos-gnome-settings
sudo pacman -S --noconfirm --needed --asdeps gnome-bluetooth-3.0 gst-plugin-pipewire gst-plugins-good
sudo pacman -S --noconfirm --needed system-config-printer networkmanager
sudo systemctl enable gdm
sudo pacman -S --noconfirm --needed baobab decibels showtime gnome-disk-utility gnome-logs gnome-calculator gnome-console amberol gnome-control-center papers loupe resources simple-scan nautilus
sudo pacman -S --noconfirm --needed curtail video-trimmer fragments gnome-boxes
sudo pacman -S --noconfirm --needed gnome-shell-extensions extension-manager gvfs-goa gvfs-dnssd

sudo pacman -S --noconfirm --needed yay-bin

## CachyOS
##
sudo pacman -S --noconfirm --needed appmenu-gtk-module libdbusmenu-glib
tldr --update
sudo pacman -S --noconfirm --needed fuse2
sudo pacman -S --noconfirm --needed flatpak
flatpak install -y flathub it.mijorus.gearlever

sudo tee -a /etc/default/limine > /dev/null <<'EOF'

KERNEL_CMDLINE[default]+=" manitosik=1 zswap.enabled=0 nowatchdog quiet splash amd_pstate=passive rcutree.enable_rcu_lazy=1 amdgpu.ppfeaturemask=0xffffffff"
EOF

sudo pacman -S --noconfirm --needed cachyos-gaming-meta
sudo pacman -S --noconfirm --needed gamescope goverlay mangohud lib32-mangohud
sudo pacman -S --noconfirm --needed heroic-games-launcher-bin steam
yay -S --noconfirm --needed hydra-launcher-bin
mkdir -p ~/.config/environment.d/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/config/environment.d/gaming.conf | tee ~/.config/environment.d/gaming.conf > /dev/null

curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/udev/rules.d/60-ioschedulers.rules | sudo tee /etc/udev/rules.d/60-ioschedulers.rules > /dev/null

sudo pacman -S --noconfirm --needed scx-scheds scx-tools
sudo systemctl disable --now ananicy-cpp
sudo mkdir -p /etc/scx_loader/
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/scx_loader/config.toml | sudo tee /etc/scx_loader/config.toml > /dev/null
sudo systemctl enable --now scx_loader.service
##
## CachyOS

flatpak install -y flathub io.github.wartybix.Constrict

flatpak install -y flathub com.usebottles.bottles

sudo pacman -S --noconfirm --needed profile-sync-daemon
systemctl enable --user --now psd.service
sudo systemctl disable --now systemd-oomd.service
sudo pacman -S --noconfirm --needed bpftune-git
sudo systemctl enable --now bpftune.service
sudo pacman -S --noconfirm --needed bluez
sudo systemctl enable --now bluetooth.service
systemctl disable --user --now arch-update.timer arch-update-tray.service

sudo systemctl disable --now power-profiles-daemon.service
sudo pacman -Rns --noconfirm power-profiles-daemon
sudo pacman -S --noconfirm --needed cpupower.service
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/default/cpupower-service.conf | sudo tee /etc/default/cpupower-service.conf > /dev/null
sudo systemctl enable --now cpupower.service
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/systemd/resolved.conf.d/resolved.conf | sudo tee /etc/systemd/resolved.conf.d/resolved.conf > /dev/null
curl -fsSL https://raw.githubusercontent.com/MAnitosik/cachy/refs/heads/main/etc/hosts | sudo tee /etc/hosts > /dev/null


sudo pacman -S --noconfirm --needed bazaar chromium
sudo pacman -S --noconfirm --needed cachyos-firefox-settings

sudo pacman -S --noconfirm --needed zed github-cli pycharm-community-edition
flatpak install -y flathub org.desktop_plus.desktop-plus

sudo pacman -S --noconfirm --needed mesa vulkan-radeon
yay -S --noconfirm --needed amf-amdgpu
sudo pacman -S --noconfirm --needed --asdeps obs-studio-plugin-browser
sudo pacman -S --noconfirm --needed obs-studio gimp
yay -S --noconfirm --needed photogimp
flatpak install -y flathub org.onlyoffice.desktopeditors

sudo pacman -S --noconfirm --needed telegram-desktop vesktop-bin torbrowser-launcher lact gnome-firmware
sudo pacman -S --noconfirm --needed ventoy-bin
yay -S --noconfirm --needed amneziavpn-bin
sudo sh -c "$(curl -Ls https://github.com/v2rayA/v2rayA-installer/raw/main/installer.sh)" @ --with-xray
sudo systemctl enable --now v2raya.service
sudo systemctl enable --now lactd.service


yay -S --noconfirm --needed --asdeps jdk-temurin
yay -S --noconfirm --needed elyprismlauncher-bin
flatpak install -y flathub org.vinegarhq.Sober org.vinegarhq.Vinegar
sudo pacman -S --noconfirm --needed --asdeps hip-runtime-amd hiprt
sudo pacman -S --noconfirm --needed blender godot-mono

sudo limine-mkinitcpio

echo "use cachyos-rate-mirrors sometimes, also dont enable vulkan shaders pre-caching in steam settings"
