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

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    # Terminal
    kitty
    
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
    dunst
    
    # Image viewer
    imv
    
    # PDF viewer
    zathura
    
    # Archives
    file-roller
    
    # System monitoring
    btop
    
    # Screenshots & screen recording
    wf-recorder

    # Wallpaper
    swww
    hyprpaper

    # Emoji
    bemoji
  ];

  home.stateVersion = "25.11";
}
