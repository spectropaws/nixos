{ config, pkgs, ... }:

{
  home.username = "spectropaws";
  home.homeDirectory = "/home/spectropaws";

  home.packages = with pkgs; [
    kitty
    dunst
    networkmanagerapplet
    libnotify
  ];

  wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$menu" = "rofi -show drun -show-icons";

      monitor = ",preferred,auto,1";
   
      bind = [
        "$mod, Return, exec, $terminal"
	"$mod, Space, exec, $menu"
	"$mod, Q, killactive,"
	"$mod, M, exit,"
      ];
    };
  };

  programs.waybar.enable = true;
 
  programs.rofi = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
