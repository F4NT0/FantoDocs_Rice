# Ranger configuration

## Instalation

- To install Ranger into nixOS use the following command:

```shell
nix-env -iAv nixos.ranger
```

- or install by configuration.nix directly:

```nix
enviroment.systemPackages = with pkgs; [
    ranger
];
```

## Image vizualization

- Website of Ranger: [https://ranger.github.io/](https://ranger.github.io/)

- in NixOS there's a problem showing images, need to activate use of images and change the default image viewer w3m to kitty

```shell
set preview_images true
set preview_images_method jitty
```

## Font into kitty terminal







