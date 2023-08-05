# How to install and manage fonts on Linux

## Install a font

- You can download any font, I like the `FiraCode Nerd Font` from Nerd Font.
- In NixOS you can download a font from the `etc/nixos/configuration.nix` file like this example:

```nix
# -------------------
# FONT CONFIGURATION
# ------------------- 

  fonts = {
     fonts = with pkgs; [
       (nerdfonts.override { fonts = [ "FiraCode"]; })
     ];
   };
```

## Add into Kitty Terminal

- Change the name of the font like below

```shell
# Font (choose a nerdfont)
font_family      FiraCode Nerd Font
bold_font        auto
italic_font      auto
bold_italic_font auto
```

## Add into Waybar

- You can change the font into the `style.css` file

```css
#waybar {
    background: transparent;
    color: #c6cdd5;
    background-color: #0d1117;
    font-family: FiraCode Nerd Font;
    font-size: 12px;
}
```

## Add into Ranger

- Ranger already get the font from Kitty terminal

## Add into Rofi

- You can change the Rofi font updating the `config.rasi` file.

```shell
configuration {
	modi:                       "drun,run,filebrowser,ssh,window";
    show-icons:                 true;
    font: "FiraCode Nerd Font";
    display-drun:               "💽 Apps";
    display-run:                " Run";
    display-filebrowser:        " Files";
    display-window:             " Windows";
	display-ssh:                " SSH";
	drun-display-format:        "{name}";
	window-format:              "{w} · {c} · {t}";
}
```

## Add into oh-my-posh

- oh-my-posh get the same font configured into Kitty console.