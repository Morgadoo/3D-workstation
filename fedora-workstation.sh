#!/bin/bash


echo "---------------------- Start Installation ----------------------"

###
# Update and Upgrade
###

sudo dnf update -y && sudo dnf upgrade -y


###
# Optionally clean all dnf temporary files
###

sudo dnf clean all

###
# RpmFusion Free Repo
# This is holding only open source, vetted applications - fedora just cant legally distribute them themselves thanks to 
# Software patents
###
echo "---------------------- RpmFusion Free Repo ----------------------"

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

###
# RpmFusion NonFree Repo
# This includes Nvidia Drivers and more
###
echo "---------------------- RpmFusion NonFree Repo ----------------------"

sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# vscodium, an open source fork of vscode
# sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
# sudo dnf install -y codium


###
# Force update the whole system to the latest and greatest
###

# sudo dnf upgrade --best --allowerasing --refresh -y

# And also remove any packages without a source backing them
sudo dnf distro-sync -y

###
# Update and Upgrade
###
echo "---------------------- Update and Upgrade ----------------------"

sudo dnf update -y && sudo dnf upgrade -y


###
# Install nvidia drivers
###
echo "---------------------- Install nvidia drivers ----------------------"


sudo dnf install -y akmod-nvidia
sudo dnf install -y xorg-x11-drv-nvidia-cuda
nvidia-smi


###
# Install base packages and applications
###
echo "---------------------- Install base Applications ----------------------"


sudo dnf install \
-y \
blender `#3D Software Powerhouse` \
calibre `#Ebook management` \
chromium-freeworld `#Comes with hardware acceleration and all Codecs` \
# codium `#A nice editor`\
darktable `#Easy RAW Editor` \
exfat-utils `#Allows managing exfat (android sd cards and co)` \
ffmpeg `#Adds Codec Support to Firefox, and in general` \
file-roller-nautilus `#More Archives supported in nautilus` \
filezilla `#S/FTP Access` \
fuse-exfat `#Allows mounting exfat` \
fuse-sshfs `#Allows mounting servers via sshfs` \
gimp `#The Image Editing Powerhouse - and its plugins` \
gimp-data-extras \
gimp-dbp \
gimp-dds-plugin \
gimp-elsamuko \
gimp-focusblur-plugin \
gimp-fourier-plugin \
gimpfx-foundry.noarch \
gimp-high-pass-filter \
gimp-layer-via-copy-cut \
gimp-lensfun \
gimp-lqr-plugin \
gimp-luminosity-masks \
gimp-paint-studio \
gimp-resynthesizer \
gimp-save-for-web \
gimp-wavelet-decompose \
gimp-wavelet-denoise-plugin \
git `#VCS done right` \
gmic-gimp \
gnome-shell-extension-user-theme `#Enables theming the gnome shell` \
gnome-extensions-a* \
gnome-tweak-tool \
gnome-tweaks `#Your central place to make gnome like you want` \
gtkhash-nautilus `#To get a file has via gui` \
gvfs-fuse `#gnome<>fuse` \
gvfs-mtp `#gnome<>android` \
gvfs-nfs `#gnome<>ntfs` \
gvfs-smb `#gnome<>samba` \
htop `#Cli process monitor` \
inkscape  `#Working with .svg files` \
kdenlive  `#Advanced Video Editor` \
keepassxc  `#Password Manager` \
krita  `#Painting done right` \
lm_sensors `#Show your systems Temparature` \
'mozilla-fira-*' `#A nice font family` \
mpv `#The best media player (with simple gui)` \
nautilus-extensions `#What it says on the tin` \
nautilus-image-converter \
nautilus-search-tool \
p7zip `#Archives` \
papirus-icon-theme `#A quite nice icon theme` \
python3-devel `#Python Development Gear` \
rawtherapee `#Professional RAW Editor` \
telegram-desktop `#Chatting, with newer openssl and qt base!` \
transmission `#Torrent Client` \
tuned `#Tuned can optimize your performance according to metrics. tuned-adm profile powersave can help you on laptops, alot` \
unar `#free rar decompression` \
youtube-dl `#Allows you to download and save youtube videos but also to open their links by dragging them into mpv!` \
adobe-source-code-pro-fonts `#The most beautiful monospace font around` \
borgbackup `#If you need backups, this is your tool for it` \
gitg `#a gui for git, a little slow on larger repos sadly` \
nano `#Because pressing i is too hard sometimes` \
fish \
util-linux-user
# folder-color



echo "------------------------- Config Apps -------------------------"

# Set fish as the default shell
chsh -s `which fish`




echo "------------------------- Extra Apps -------------------------"

###
# Extra
###

# sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
# sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
# sudo dnf install -y sublime-text



###
# Remove some un-needed stuff
###

sudo dnf remove \
-y \
gnome-shell-extension-background-logo `#Tasteful but nah` \
totem `#With mpv installed totem became a little useless` \
chromium `#Using Chromium resets chromium-vaapi so remove it if installed, userprofiles will be kept and can be used in -vaapi`

###
# Enable some of the goodies, but not all
# Its the users responsibility to choose and enable zsh, with oh-my-zsh for example
# or set a more specific tuned profile
###

echo "------------------------- User Config -------------------------"


sudo tuned-adm profile throughput-performance

#Virtual Machine Host:
#sudo tuned-adm profile virtual-host

#Virtual Machine Guest:
#sudo tuned-adm profile virtual-guest

#Battery Saving:
#sudo tuned-adm profile powersave

sudo dnf update -y && sudo dnf upgrade -y

#dconf load / <./user.conf
#dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ >~/.config/dconf/user.conf
#dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ <./user.conf
#dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ <~/.config/dconf/user.conf
echo "------------------------- Theming Gnome -------------------------"

###
# Theming and GNOME Options
###

#Gnome Backgroud
gsettings set  org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/adwaita-timed.xml'

#Gnome Shell Theming
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
#gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
#gsettings set org.gnome.shell.extensions.user-theme name 'Arc-Dark-solid'

#Set SCP as Monospace (Code) Font
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semi-Bold 12'

#Set Extensions for gnome
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com']"

#Usability Improvements
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'adaptive'
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
gsettings set org.gnome.desktop.calendar show-weekdate true
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false


#Nautilus (File Manager) Usability
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
gsettings set org.gtk.Settings.FileChooser sort-directories-first true


sudo dnf -y autoremove

#The user needs to reboot to apply all changes.
echo "---------------------- Installation Finished - Please Reboot ----------------------"

echo "add shortcut --> gnome-terminal : ctr + alt + t"

exit 0