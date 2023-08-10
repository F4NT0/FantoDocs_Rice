# TUI Display Manager NixOS

- It's a symple screen to login into the system, simple and direct!

## Installation

- You can install to NixOS using the following command:

```shell
nix-env -iAv nixos.greetd.tuigreet
```

- you can install directly into the `etc/nixos/configuration.nix`:

```nix
environment.systemPackages = with pkgs; [
  greetd.tuigreet
];
```

## Configuration

- Add the following configuration into your `etc/nixos/configuration.nix`:

```shell
# ---------------------- 
# TUIGREET LOGIN MANAGER
# ----------------------
services.greetd = {
  enable = true;
  settings = {
    default_session.command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
      --time \
      --asterisks \
      --user-menu \
      --cmd Hyprland
    '';
  };
};
```

- reload nixos configuration:

```shell
sudo nixos-rebuild switch
```