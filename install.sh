#!/usr/bin/env bash
set -euxo pipefail

VERSION=$(curl https://raw.githubusercontent.com/SirStig/Steam-deck-tests/main/version.txt)

printf "Installing Pikdums Tools Version: ${VERSION}";

mkdir -p ~/.local/share/applications/

rm -r ~/.pikdum
mkdir -p ~/.pikdum
cd ~/.pikdum
wget -O steam-deck.zip https://github.com/SirStig/Steam-deck-tests/archive/refs/heads/main.zip
unzip -o steam-deck.zip
rm steam-deck.zip
mv steam-deck-tests-main steam-deck-master

~/.pikdum/steam-deck-master/post-install.sh

printf "Success! Exiting in 3..."
sleep 3

