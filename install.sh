#!/bin/bash
sudo apt update && sudo apt upgrade -y

mkdir -p ~/.config
mkdir -p ~/.fonts
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/github

bash ~/github/SwayDebian/scripts/packages.sh
clear

bash ~/github/SwayDebian/scripts/sway.sh
clear

bash ~/github/SwayDebian/scripts/fonts.sh
clear

bash ~/github/SwayDebian/scripts/build-from-source.sh
clear
