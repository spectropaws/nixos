{ pkgs, ... }:

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


  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support
}
