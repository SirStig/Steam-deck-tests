#!/usr/bin/bash
VORTEX_PREFIX=~/.vortex-linux/compatdata/pfx;
printf "%s\n" "INFO: Searching for all script extender launchers!";
rmlink(){
    if [ -h "$1" ];
    then unlink "$1";
    fi;
}
mklink(){
    rmlink "$2";
    ln -s -T "$1" "$2";
}
manifest_attribute(){
    grep -a -o -e "\"$2\"[[:space:]]*\".*\"$" "$1" \
    | sed "s/\"$2\"[[:space:]]*\"//;s/\"$//";
};
manifest_userconfig_attribute(){
    manifest_attribute \
    <(grep \
        -a -o -P -z \
        "\"UserConfig\"\s*{(\s*[^}]*\s*)*}" \
        "$1"\
    ) "$2";
};
manifest_mountedconfig_attribute(){
    manifest_attribute \
    <(grep \
        -a -o -P -z \
        "\"MountedConfig\"\s*{(\s*[^}]*\s*)*}" \
        "$1"\
    ) "$2";
};
sed "s/\"\/.*\"$/\"C:\\\\\\\\Program Files \(x86\)\\\\\\\\Steam\"/g" < \
~/.steam/steam/steamapps/libraryfolders.vdf |& tee \
"$VORTEX_PREFIX/drive_c/Program Files (x86)/Steam/steamapps/libraryfolders.vdf" \
"$VORTEX_PREFIX/drive_c/Program Files (x86)/Steam/config/libraryfolders.vdf" \
1>/dev/null;
STEAM_LIBRARY_PATHS=();
while read -r library; do
    rmdir --ignore-fail-on-non-empty "$library"/steamapps/common/* 2>/dev/null;
    if [ -d "$library" ] && [ -d "$library/steamapps/common" ]; then
        if [ -d "$library/steamapps/compatdata/" ]; then
        STEAM_COMPATDATA=("$(find "$library/steamapps/compatdata/" -type d -name "pfx")");
        for compatdata in "${STEAM_COMPATDATA[@]}"; do
            rmdir --ignore-fail-on-non-empty "$compatdata" 2>/dev/null;
        done;
        fi;
        STEAM_LIBRARY_PATHS+=("$library");
    fi;
done < <(grep -a -o -e "/[^\"]*" ~/.steam/steam/steamapps/libraryfolders.vdf);
printf "%s\n" "INFO: Found Steam Library at \"$library\"!";



printf "%s\n" "DONE: Finished!";

printf "Going to sleep in 3...";

sleep 3
