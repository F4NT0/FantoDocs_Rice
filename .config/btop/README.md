# btop configuration

- btop is the best console TUI to show information from the operational system

## Installation

- You can install kitty on NixOS using the following command:

```shell
nix-env -iAv nixos.btop
```

- Or add into your nixos configuration file like below:

```kitty
enviroment.systemPackages = with pkgs; [
    btop
];
```

## Configuration