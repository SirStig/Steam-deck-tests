#!/usr/bin/env sh
set -euxo pipefail

ln -sf ~/.pikdum/steam-deck-master/update.desktop ~/Desktop/pikdum-update.desktop

if [ ! -f "$HOME/.local/share/applications/vortex.desktop" ]; || [ ! -f "$HOME/.vortex-linux/compatdata/pfx/drive_c/Program Files/Black Tree Gaming Ltd/Vortex/Vortex.exe" ]; then
    if [ -f "$HOME/.local/share/applications/vortex.desktop" ];
       rm -f $HOME/.local/share/applications/vortex.desktop
       rm -f ~/Desktop/vortex.desktop
    fi
    ln -s ~/.pikdum/steam-deck-master/vortex/install-vortex.desktop ~/Desktop/install-vortex.desktop || true
fi

mkdir -p /run/media/mmcblk0p1/vortex-downloads || true
