#!/usr/bin/env bash

VERSION=$(curl https://raw.githubusercontent.com/SirStig/Steam-deck-tests/main/version.txt)

printf "%s\n" "Installing Pikdums Tools Version: ${VERSION}";

mkdir -p ~/.local/share/applications/

rm -r ~/.pikdum
mkdir -p ~/.pikdum
cd ~/.pikdum
wget -O steam-deck.zip https://github.com/SirStig/Steam-deck-tests/archive/refs/heads/main.zip
unzip -o steam-deck.zip
rm steam-deck.zip
mv Steam-deck-tests-main steam-deck-master

~/.pikdum/steam-deck-master/post-install.sh

printf "%s\n" "Success! Exiting in 3..."
sleep 3

