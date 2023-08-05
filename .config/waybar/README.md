# Waybar configuration

<p align="center">
    <img src="images/waybar.png">
</p>

## Installation

- Insert into the `etc/nixos/configuration.nix` the waybar software:

```shell
environment.systemPackages = with pkgs; [
    waybar
];
```

## Configuration

- The folder configuration of the waybar is located at: `~/.config/waybar/`
- The file configuration is called `config` and is located in this repo mine
- The style from the waybar is located at `style.css` and is located in this repo