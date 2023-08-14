# Fish Terminal

Fish terminal is one of the best and most configurable terminals for linux

## Install

- You can install using this NixOS command:

```shell
nix-env -iAv nixos.fish
```

- Or you can add fish to your `etc/nixos/configuration.nix` file:

```shell
enviroment.systemPackages = with pkgs; [
    fish
];
```

## Configuration

- The configuration file is in `~/.config/fish` directory.
- The main configuration file is `config.fish`.

## Add into Kitty

to add the shell into Kitty you need to add this code into `.config/kitty/kitty.conf`:

```shell
# terminal emulator selected
shell fish
```

## Change colors

- In the console, just run the following command to open a browser page with the color configs:

```shell
fish_config
```