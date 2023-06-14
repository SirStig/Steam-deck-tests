#!/usr/bin/env sh
set -euxo pipefail

#Directoy References

STEAMCOMMON=$(find / -type d -name steamapps) + "/common/"
STEAMCOMPAT=$(find / -type d -name steamapps) + "/compatdata/"

FALLOUT3_INTERNAL="$HOME/.steam/steam/steamapps/common/Fallout 3/"
FALLOUT3_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Fallout 3/"
FALLOUTNV_INTERNAL="$HOME/.steam/steam/steamapps/common/Fallout New Vegas/"
FALLOUTNV_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Fallout New Vegas/"
FALLOUT4_INTERNAL="$HOME/.steam/steam/steamapps/common/Fallout 4/"
FALLOUT4_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Fallout 4/"
OBLIVION_INTERNAL="$HOME/.steam/steam/steamapps/common/Oblivion/"
OBLIVION_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Oblivion/"
SKYRIM_INTERNAL="$HOME/.steam/steam/steamapps/common/Skyrim Special Edition/"
SKYRIM_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Skyrim Special Edition/"
OLDRIM_INTERNAL="$HOME/.steam/steam/steamapps/common/Skyrim/"
OLDRIM_EXTERNAL="/run/media/mmcblk0p1/steamapps/common/Skyrim/"
INIFILES_VORTEX="$HOME/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/Documents/My Games/FalloutNV/"
INIFILES_INTERNAL="$HOME/.local/share/Steam/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/Documents/My Games/FalloutNV/"
INIFILES_EXTERNAL="/run/media/mmcblk0p1/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/Documents/My Games/FalloutNV/"

#Fallout 3
fose_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}fose_loader.exe" ] &&
        [ -f "${1}Fallout3Launcher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "fose_loader.exe" "Fallout3Launcher.exe"; then
            echo "Swapping Fallout3Launcher.exe for fose_loader.exe"
            mv Fallout3Launcher.exe _Fallout3Launcher.exe
            cp fose_loader.exe Fallout3Launcher.exe
        fi
    fi
}

if [ -f "${FALLOUT3_INTERNAL}Fallout3Launcher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout3/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/22300/pfx/drive_c/users/steamuser/AppData/Local/fallout3/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout3/plugins.txt ~/.local/share/Steam/steamapps/compatdata/22300/pfx/drive_c/users/steamuser/AppData/Local/fallout3/
	fose_setup "$FALLOUT3_INTERNAL"
	echo "Fallout 3 found in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${FALLOUT3_EXTERNAL}Fallout3Launcher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout3/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/22300/pfx/drive_c/users/steamuser/AppData/Local/fallout3/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout3/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/22300/pfx/drive_c/users/steamuser/AppData/Local/fallout3/
	fose_setup "$FALLOUT3_EXTERNAL"
	echo "Fallout 3 found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Fallout 3 not found."
fi

#Fallout New Vegas
nvse_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}nvse_loader.exe" ] &&
        [ -f "${1}FalloutNVLauncher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "nvse_loader.exe" "FalloutNVLauncher.exe"; then
            echo "Swapping FalloutNVLauncher.exe for nvse_loader.exe"
            mv FalloutNVLauncher.exe _FalloutNVLauncher.exe
            cp nvse_loader.exe FalloutNVLauncher.exe
        fi
    fi
}

if [ -f "${FALLOUTNV_INTERNAL}FalloutNVLauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/plugins.txt ~/.local/share/Steam/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/
	nvse_setup "$FALLOUTNV_INTERNAL"
	ln -sf "${INIFILES_INTERNAL}Fallout.ini" "$INIFILES_VORTEX"
    ln -sf "${INIFILES_INTERNAL}FalloutPrefs.ini" "$INIFILES_VORTEX"
	echo "Fallout NV found in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${FALLOUTNV_EXTERNAL}FalloutNVLauncher.exe"  ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/22380/pfx/drive_c/users/steamuser/AppData/Local/falloutnv/
	nvse_setup "$FALLOUTNV_EXTERNAL"
	ln -sf "${INIFILES_EXTERNAL}Fallout.ini" "$INIFILES_VORTEX"
    ln -sf "${INIFILES_EXTERNAL}FalloutPrefs.ini" "$INIFILES_VORTEX"
	echo "Fallout NV found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Fallout NV not found."
fi

#Fallout 4
f4se_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}f4se_loader.exe" ] &&
        [ -f "${1}Fallout4Launcher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "f4se_loader.exe" "Fallout4Launcher.exe"; then
            echo "Swapping Fallout4Launcher.exe for f4se_loader.exe"
            mv Fallout4Launcher.exe _Fallout4Launcher.exe
            cp f4se_loader.exe Fallout4Launcher.exe
        fi
    fi
}

if [ -f "${FALLOUT4_INTERNAL}Fallout4Launcher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout4/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local/Fallout4/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout4/plugins.txt ~/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local/Fallout4/
	f4se_setup "$FALLOUT4_INTERNAL"
	echo "Fallout 4 found in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${FALLOUT4_EXTERNAL}Fallout4Launcher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout4/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local/Fallout4/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/fallout4/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local/Fallout4/
	f4se_setup "$FALLOUT4_EXTERNAL"
	echo "Fallout 4 found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Fallout 4 not found."
fi

#Oblivion
obse_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}obse_loader.exe" ] &&
        [ -f "${1}OblivionLauncher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "obse_loader.exe" "OblivionLauncher.exe"; then
            echo "Swapping OblivionLauncher.exe for obse_loader.exe"
            mv OblivionLauncher.exe _OblivionLauncher.exe
            cp obse_loader.exe OblivionLauncher.exe
        fi
    fi
}

if [ -f "${OBLIVION_INTERNAL}OblivionLauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/22330/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/plugins.txt ~/.local/share/Steam/steamapps/compatdata/22330/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/
	obse_setup "$OBLIVION_INTERNAL"
	echo "Oblivion found in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${OBLIVION_EXTERNAL}OblivionLauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/22330/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/22330/pfx/drive_c/users/steamuser/AppData/Local/Oblivion/
	obse_setup "$OBLIVION_EXTERNAL"
	echo "Oblivion found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Oblivion not found."
fi

#Skyrim SE/AE
skse_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}skse64_loader.exe" ] &&
        [ -f "${1}SkyrimSELauncher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "skse64_loader.exe" "SkyrimSELauncher.exe"; then
            echo "Swapping SkyrimSELauncher.exe for skse64_loader.exe"
            mv SkyrimSELauncher.exe _SkyrimSELauncher.exe
            cp skse64_loader.exe SkyrimSELauncher.exe
        fi
    fi
}

if [ -f "${SKYRIM_INTERNAL}SkyrimSELauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/plugins.txt ~/.local/share/Steam/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/
	skse_setup "$SKYRIM_INTERNAL"
	echo "Skyrim SE/AE in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${SKYRIM_EXTERNAL}SkyrimSELauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/489830/pfx/drive_c/users/steamuser/AppData/Local/Skyrim Special Edition/
	skse_setup "$SKYRIM_EXTERNAL"
	echo "Skyrim SE/AE found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Skyrim SE/AE not found."
fi

#Oldrim (Skyrim LE)
oldrim_setup() {
    if [ -d "$1" ] &&
        [ -f "${1}skse_loader.exe" ] &&
        [ -f "${1}SkyrimLauncher.exe" ]; then
        cd "$1"
        if ! cmp --silent -- "skse_loader.exe" "SkyrimLauncher.exe"; then
            echo "Swapping SkyrimLauncher.exe for skse_loader.exe"
            mv SkyrimLauncher.exe _SkyrimLauncher.exe
            cp skse_loader.exe SkyrimLauncher.exe
        fi
    fi
}

if [ -f "${OLDRIM_INTERNAL}SkyrimLauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/loadorder.txt ~/.local/share/Steam/steamapps/compatdata/2028782/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/plugins.txt ~/.local/share/Steam/steamapps/compatdata/2028782/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/
	oldrim_setup "$OLDRIM_INTERNAL"
	echo "Skyrim LE in the Internal drive. Creating Symlinks and swapping launchers."
elif [ -f "${OLDRIM_EXTERNAL}SkyrimLauncher.exe" ]; then
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/loadorder.txt /run/media/mmcblk0p1/steamapps/compatdata/2028782/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/
	ln -sf ~/.vortex-linux/compatdata/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/plugins.txt /run/media/mmcblk0p1/steamapps/compatdata/2028782/pfx/drive_c/users/steamuser/AppData/Local/Skyrim/
	oldrim_setup "$OLDRIM_EXTERNAL"
	echo "Skyrim LE found in the External drive. Creating Symlinks and swapping launchers."
else
    echo "Skyrim LE not found."
fi

echo $STEAMCOMMON
echo $STEAMCOMPAT

echo "Success! Exiting in 3..."
sleep 20



















