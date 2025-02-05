#!/bin/bash
sudo apt update && sudo apt upgrade -y

mkdir -p ~/.config
mkdir -p ~/.fonts
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/github
mkdir -p ~/packages

bash ~/github/sway-debian/scripts/packages.sh
clear

bash ~/github/sway-debian/scripts/sway.sh
clear

bash ~/github/sway-debian/scripts/fonts.sh
clear

bash ~/github/sway-debian/scripts/build-from-source.sh
clear
