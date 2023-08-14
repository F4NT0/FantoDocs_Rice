# App notificator DUNST

## Install

- You can install using this NixOS command:

```shell
nix-env -iAv nixos.dunst
```

- Or you can add fish to your `etc/nixos/configuration.nix` file:

```shell
enviroment.systemPackages = with pkgs; [
    dunst
];
```

## Configuration

- The config file is encontered in `~/.config/dunst/` and the file is called `dunstrc`.