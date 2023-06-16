#!/usr/bin/env bash
set -euxo pipefail

VERSION=$(curl https://raw.githubusercontent.com/pikdum/steam-deck/main/version.txt)

printf "Installing Pikdum's Tools Version: $VERSION";

mkdir -p ~/.local/share/applications/

mkdir -p ~/.pikdum
cd ~/.pikdum
wget -O steam-deck.zip https://github.com/pikdum/steam-deck/archive/refs/heads/master.zip
unzip -o steam-deck.zip
rm steam-deck.zip

~/.pikdum/steam-deck-master/post-install.sh

printf "Success! Exiting in 3..."
sleep 3
