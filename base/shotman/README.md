# Screenshot capture shotman

- Shotman is a screenshot program who takes screenshot from terminal.

## Install

```shell
nix-env -iAv nixos.slurp nixos.shotman
```

## Usage

- Select a part of the screen
- Press <kbd>Esc</kbd> to save
- Press <kbd>Del</kbd> to delete and not save
- It's going to save on clipboard and in the `~/screenshots` folder

```shell
shotman --capture region
```

## Keyboard configuration

In our `~/.config/hypr/hyprland.conf` we are going to add the following keyboard shortcut:

```shell
bind = $mainMod, X, exec, shotman --capture region # screenshot using shotman
```

