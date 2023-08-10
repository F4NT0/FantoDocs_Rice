# Wallpaper manager for Hyprland

## Installation

- To install on NixOS, use the following command:

```shell
nix-env -iAv nixos.hyprpaper
```

## Configuration

- Create a configuration file in `~/.config/hypr/hyprpaper.conf`
- Add the following code:

```shell
preload = /home/fanto/Pictures/Wallpapers/Github-Wallpaper.png #path to wallpaper
wallpaper = LVDS-1,/home/fanto/Pictures/Wallpapers/Github-Wallpaper.png #name of monitor and path to wallpaper
```

- You can see the name of the windows with the command:

```shell
hyprctl monitors
```

- After that, insert the following line in the beggining of the `~/.config/hypr/hyprland.conf`

```shell
# ----------
# WALLPAPER
# ----------
exec-once = hyprpaper
```

