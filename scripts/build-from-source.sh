#!/bin/bash

#Neovim
sudo apt-get install ninja-build gettext cmake curl build-essential -y

cd ~/github

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout tags/stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

#Rust
cd ~/
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup override set stable
rustup update stable

#Alacritty
sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 scdoc gzip -y
cd ~/github
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
infocmp alacritty
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

#Codium
cd ~/

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install codium -y

#Zen-Browser (2025-feb-05)
cd ~/packages
wget https://github.com/zen-browser/desktop/releases/download/1.7.4b/zen.linux-x86_64.tar.bz2
tar -zvjf zen.linux-x86_64.tar.bz2
echo "export PATH=\$PATH:\$HOME/packages/zen" >> $HOME/.bashrc
source .bashrc
sudo ln -sf $HOME/packages/zen/zen-bin /usr/local/bin/zen

cd $HOME

echo "DONEEE!!"
