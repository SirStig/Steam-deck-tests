#!/usr/bin/env sh
set -euxo pipefail

printf "Checking for shortcuts...";

ln -sf ~/.pikdum/steam-deck-master/update.desktop ~/Desktop/pikdum-update.desktop

if [ ! -f "$HOME/.local/share/applications/vortex.desktop" ] || [ ! -f "~/.vortex-linux/compatdata/pfx/drive_c/Program Files/Black Tree Gaming Ltd/Vortex/Vortex.exe" ] then
    if [ -f "$HOME/.local/share/applications/vortex.desktop" ];
       rm -f $HOME/.local/share/applications/vortex.desktop
       rm -f ~/Desktop/vortex.desktop
    fi
    ln -s ~/.pikdum/steam-deck-master/vortex/install-vortex.desktop ~/Desktop/install-vortex.desktop || true
    printf "Vortex not found. Creating install-vortex.desktop";
else
   ln -sf ~/.pikdum/steam-deck-master/vortex/vortex-post-updater.desktop ~/Desktop/
   ln -sf ~/.pikdum/steam-deck-master/vortex/update-vortex-library.desktop ~/Desktop/
fi

printf "Checking for old Pikdum's files..."
#Check if post-deploy scripts and shortcuts exist.
if [ -L "~/Desktop/fallout3-post-deploy.desktop" ] || [ -L "~/Desktop/fallout4-post-deploy.desktop" ] || [ -L "~/Desktop/fallout4-post-deploy.desktop" ] || [ -L "~/Desktop/falloutnv-post-deploy.desktop" ] || [ -L "~/Desktop/falloutnv-pre-deploy.desktop" ] || [ -L "~/Desktop/oblivion-post-deploy.desktop" ] || [ -L "~/Desktop/skyrim-post-deploy.desktop" ] || [ -L "~/Desktop/skyrimle-post-deploy.desktop" ]; then
   rm "~/Desktop/fallout4-post-deploy.desktop" "~/Desktop/fallout3-post-deploy.desktop" "~/Desktop/falloutnv-post-deploy.desktop" "~/Desktop/falloutnv-pre-deploy.desktop" "~/Desktop/oblivion-post-deploy.desktop" "~/Desktop/skyrim-post-deploy.desktop" "~/Desktop/skyrimle-post-deploy.desktop";
   printf "Found old Deploy links removing..."
fi

mkdir -p /run/media/mmcblk0p1/vortex-downloads || true

printf "Done! Sleeping in 3...";

sleep 3