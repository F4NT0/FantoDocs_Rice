# How to configure Hyprland on NixOS

- NixOS configuration folder location:

```shell
etc/nixos/configuration.nix
```

- Put this configuration into the file:

```shell
programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
```

<p align="center">
  <img src="https://github.com/F4NT0/FantoDocs_Rice/assets/18719295/3b4e71eb-d964-4ccf-8fad-37960cb5d1b9">
</p>


- Restart the system with:

```shell
sudo nixos-rebuild switch
```
