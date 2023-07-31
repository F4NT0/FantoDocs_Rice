# Como configurar e instalar Hyprland no NixOS

- Localizaçao do arquivo de configuraçao do nixOS:

```shell
etc/nixos/configuration.nix
```

- Colocar a seguinte configuracao no arquivo:

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


- Reinicie o computador com o seguinte comando:

```shell
sudo nixos-rebuild switch
```
