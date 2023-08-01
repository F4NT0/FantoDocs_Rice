# light software

- This is a simple program to configure the brightness of the hyprland and other wm who doesn't have the GUI configuration.

## Instalation

- on NixOS you can install light use the following command:

```shell
nix-env -iAv nixos.light
```

## Use

- You can decrease brightness using the command:

> Note
> be careful for do not go below 30 because you can't see almost nothing into the screen

```shell
sudo light -U 30
```

- You can increase brightness using the command:

> Note
> you can go to 100 who means is 100%

```shell
sudo light -A 60
```
