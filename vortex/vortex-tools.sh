#!/usr/bin/bash
printf "%s\n" "INFO: Running Pikdum's Tools for Vortex"
printf "%s\n" "INFO: Checking for updates"
PIKDUMSVERSION=$(cut -d "#" -c 1-5 $(curl https://raw.githubusercontent.com/SirStig/Steam-deck-tests/main/CHANGELOG.md));
if []; then
else
fi
printf "%s\n" "INFO: Please select a tool from below by typing 1, 2, or 3:"
printf "%s\n" " 1: Update Vortex Game Library (Creates Symlinks for all found games for vortex)"
printf "%s\n" " 2: Use Script Extender Launchers (Swaps all default game launchers for the script extender launchers.)"
printf "%s\n" " 3: Swap to Vanilla Launcher (Allows you to pick a game to swap back to default/vanilla launcher)"
read tool
if [ "$tool" == "1" ]; then
    ~/.pikdum/steam-deck-master/vortex/update-vortex-library.sh;
elif [ "$tool" == "2" ]; then
    ~/.pikdum/steam-deck-master/vortex/use-script-extender-launchers.sh;
elif [ "$tool" == "3" ]; then
    ~/.pikdum/steam-deck-master/vortex/swap-to-vanilla-launcher.sh;
else
    printf "%s\n" "ERROR: No tool select. Please try again by typing 1, 2, or 3"
fi
    
