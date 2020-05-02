#!/usr/bin/env bash

sudo apt-add-repository ppa:graphics-drivers/ppa && sudo apt update

sudo apt install xorriso libssl1.0.0 ocl-icd-opencl-dev fakeroot

sudo apt install snapd -y
sudo snap install blender --classic -y
sudo snap install android-studio -y
sudo apt install krita -y
sudo apt install inkscape -y
sudo apt install chromium  -y



## Download de Programas externos ##
mkdir /home/$USER/Transferências/Programas

cd /home/$USER/Transferências/Programas

wget -c https://github.com/EpicGames/UnrealEngine/archive/release.zip
wget -c https://developer.unigine.com/file-server/resource/40
wget -c https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage
wget -c https://render.otoy.com/downloads/8a/3f/ba/b2/octane_server_prime_2020.1-21.7-stable.run
wget -c https://render.otoy.com/downloads/cf/e9/6b/fd/octane_blender_2020.1-21.7-stable.run
wget -c https://leyfi.allegorithmic.com/softwares/5c8ba95a78f84c00173b0411/builds/beta/latest?platform=lin-rpm&download=1
wget -c https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.17.6856.tar.gz




sudo apt update && sudo apt dist-upgrade -y
echo "Fim da Instalação - \n Falta: \n
https://www.sidefx.com/download/houdini-for-linux/ \n
https://www.blackmagicdesign.com/pt/products/davinciresolve/"