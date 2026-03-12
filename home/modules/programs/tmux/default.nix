{ lib, pkgs, config, ... }:

{
  imports = [
    ./keybindings.nix
    ./catppuccin.nix
    ./statusbar.nix
    ./plugins
  ];

  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    baseIndex = 1;
    historyLimit = 10000;

    extraConfig = lib.mkOrder 2000 ''
      set -g pane-base-index 1
      set -g allow-rename on
      set -g renumber-window off
      set -g status-position top
      set -g status-interval 5

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf
    '';
  };
}
