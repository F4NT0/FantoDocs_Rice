# Kitty Console Configuration

## Installation

- You can install kitty on NixOS using the following command:

```shell
nix-env -iAv nixos.kitty
```

- Or add into your nixos configuration file like below:

```kitty
enviroment.systemPackages = with pkgs; [
    kitty
];
```

## Configuration 

- The file configuration is in `~/.config/kitty/kitty.conf`
- My configuration is in the **kitty.conf** file in this folder
- my Kitty theme is in the **Github.conf** file in this folder 

## Prompt Configuration

- We are going to use oh-my-posh to configure the terminal

### Download oh-my-posh

- First download the unzip

```shell
nix-env -iAv nixos.unzip
```

- Then install oh-my-posh

```shell
nix-env -iAv nixos.oh-my-posh
```

- To check if it was installed

```shell
eval "$(oh-my-posh init bash)"
```

### Configure oh-my-posh

- I create a theme to use in my console, in the **fantodocs.omp.json**
- I call in the end of the .bashrc where is my bash configuration
