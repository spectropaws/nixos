{ pkgs, inputs, ... }:

{
  programs = {
    firefox.enable = true;
    dconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
	thunar-volman
      ];
    };
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
