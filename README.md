# Pikdum's Steam Deck Tools

> **Notice:** Recently swapped Vortex install method from STL to [pikdum/vortex-linux](https://github.com/pikdum/vortex-linux).  
> This is a breaking change, so you'll need to uninstall + reinstall.  
> It's also completely new, so there might be bugs.  

## What is this

A Collection of tools and scripts for linux/steam-deck. 

Currently Tools:
- Vortex Installer
- Vortex Fixes for linux/steamdeck

## Install

1. Right click and save as [this install.desktop link](https://raw.githubusercontent.com/pikdum/steam-deck/master/install.desktop)
2. Go to downloads folder and double click to run it

## Vortex Mod Manager

After installing, you should have a shortcut on the desktop to install vortex

This will:

0. Install SteamLinuxRuntime Sniper
1. Install pikdum/vortex-linux
2. Use ./vortex-linux to set up vortex
3. Add a 'Update Vortex Game Library' shortcut to desktop
   * Needs to be run every time after you install a new game you want to mod.
4. Map J: to internal games and K: to sd card games
   * E: is the sd card root

After modding, run games normally through game mode rather than launching through vortex

### Adding a game

* Vortex will pop up some warnings about: staging location, deployment method
   * Walk through their fixes
   * Staging folder needs to be on the same drive as the game
     * Suggested path works here
   * Deployment method should be hardlinks

### Download with vortex button link handler

> **Notice:** Heard some people mention that this requires Nexus Premium.  
> Could use some more people either confirming or denying this.  

* Might work out of the box, unless you've installed vortex before
* If it doesn't work, edit these lines in ~~`~/.local/share/applications/mimeapps.list`~~ `~/.config/mimeapps.list`
```
x-scheme-handler/nxm=vortex.desktop
x-scheme-handler/nxm-protocol=vortex.desktop
```
* Run `update-mime-database ~/.local/share/mime/`
* Might need to reboot
* If still issues, make sure your browser is using the default app

### What is the "Update Vortex Game Library" desktop shortcut?

This find's all the games on your device and basically connects folders that are needed for mods to be properly deployed and run on the games.
It also allows vortex to automatically find games installed on your device so you don't have to manually select the game folder.

## Uninstall

```bash
# remove these tools
rm -rf ~/.pikdum/
# remove vortex
rm -rf ~/.vortex-linux/
rm -rf ~/.local/share/applications/vortex.*
# manually remove desktop icons
```

## Old version uninstall

```bash
# remove steamtinkerlaunch
rm -rf ~/stl/
rm -rf ~/.config/steamtinkerlaunch/
# remove these tools
rm -rf ~/.pikdum/
rm -rf ~/.local/share/applications/pikdum-vortex.desktop
```

