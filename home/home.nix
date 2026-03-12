{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/hyprland
    ./modules/programs
    ./modules/services
  ];

  home.username = "spectropaws";
  home.homeDirectory = "/home/spectropaws";
  
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    # File management
    yazi # Terminal file manager
    ranger # Alternative terminal file manager
    
    # System utilities
    brightnessctl
    playerctl
    pamixer
    pavucontrol
    
    # Screenshots
    grim
    slurp
    swappy
    
    # Clipboard
    wl-clipboard
    cliphist
    
    # Network
    networkmanagerapplet
    
    # Notifications
    libnotify
    
    # Image viewer
    imv
    
    # PDF viewer
    zathura

    # Browsers
    brave
    
    # Archives
    file-roller
    
    # System monitoring
    btop
    
    # Screenshots & screen recording
    wf-recorder

    # Wallpaper
    hyprpaper

    # Emoji
    bemoji
  ];

  home.stateVersion = "25.11";
}
