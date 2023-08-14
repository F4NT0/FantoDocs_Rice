# Nvchad - The complete Neovim

- Neovim is a most updated vim software and NvChad is a complete Neovim configuration with a lot of softwares already configured.

## Installation

- First we need to install Neovim, you can install with the following command:

```shell
nix-env -iAv nixos.nvim
```

- Or insert into `etc/nixos/configuration.nix` the following code:

```shell
environment.systemPackages = with pkgs; [
    nvim
  ];
```

## Install Nvchad

- After install Neovim you just need to run the following code:

```shell
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## Configuration

- The basic files changed are in this repo:

```md
lua
 | - core
 |    | - default_config.lua
 |    | - init.lua
 | - custom
 |    | - chadrc.lua
 | - plugins
      | - init.lua
```

- The other files was not changed from the base config

## Commands and How to use

TBD