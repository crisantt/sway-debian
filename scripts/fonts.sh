#!/bin/bash
sudo apt install fonts-dejavu fonts-font-awesome fonts-noto-core fonts-noto-cjk fonts-noto-color-emoji fonts-hack-ttf -y

cd ~/.fonts

fonts=("FiraCode" "JetBrainsMono" "Mononoki" "Terminus" "CommitMono" "Noto")

for font in "${fonts[@]}"; do
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/${font}.zip" || { echo "Failed to download ${font}"; exit 1; }
    unzip -n "${font}.zip"
    rm -f "${font}.zip"
done

fc-cache -fv

cd ~/
