# ============================================================================================
#
# ███╗   ██╗██╗██╗  ██╗ ██████╗ ███████╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
# ████╗  ██║██║╚██╗██╔╝██╔═══██╗██╔════╝    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
# ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║███████╗    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██║╚██╗██║██║ ██╔██╗ ██║   ██║╚════██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ██║ ╚████║██║██╔╝ ██╗╚██████╔╝███████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
#
# ============================================================================================

# ----------------------
# IMPORTS AND VARIABLES
# ---------------------

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # --------------------------
  # BOOTLOADER CONFIGURATIONS
  # --------------------------

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # ----------------------
  # NETWORK CONFIGURATION
  # ----------------------

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # ----------------------
  # TIMEZONE AND LOCATION
  # ----------------------

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # ------------------
  # X11 AND KDE  CONFIGURATION
  # ------------------

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

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

  # ------------------------
  # KEYBOARD CONFIGURATIONS
  # ------------------------

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";
 
  # --------------------
  # PRINT CONFIGURATION
  # --------------------

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # ---------------------
  # SOUND CONFIGURATION
  # ---------------------

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # -------------------
  # USER CONFIGURATION
  # -------------------

  users.users.fanto = {
    isNormalUser = true;
    description = "Fanto";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = false;
  services.xserver.displayManager.autoLogin.user = "fanto";

  # ------------------------------
  # ALLOW INSTALL UNFREE PACKAGES
  # ------------------------------
  
  nixpkgs.config.allowUnfree = true;

  # ------------------------------
  # PACKAGES TO INSTALL IN SYSTEM
  # ------------------------------

  environment.systemPackages = with pkgs; [
      vim
      brave
      mpv
      btop
      ranger
      ueberzug	
      gimp
      git
      wget
      waybar
      dunst
      qutebrowser
      libnotify
      kitty
      greetd.tuigreet
      picom
      rofi
      swww
      networkmanagerapplet
      neofetch
      dolphin
      gh
  ];
  
  # -------------------
  # FONT CONFIGURATION
  # ------------------- 

  fonts = {
     fonts = with pkgs; [
       (nerdfonts.override { fonts = [ "FiraCode"]; })
     ];
   };
  

  # ---------------------
  # PORTAL CONFIGURATION
  # ---------------------

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # -----------------------
  # HYPRLAND CONFIGURATION
  # -----------------------
  
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  # ------------------
  # SESSION VARIABLES
  # ------------------

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

 
  # ------------------------
  # HARDWARE CONFIGURATIONS
  # ------------------------

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # -------------------------------
  # SSH AND FIREWALL CONFIGURATION
  # -------------------------------

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # ---------------
  # NixOS VERSION
  # ---------------

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}