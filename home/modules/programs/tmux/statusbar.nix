{ lib, ... }:

{
  programs.tmux.extraConfig = lib.mkOrder 2000 ''
    set -g status-bg default
    set -g status-style bg=default

    set -g status-left-length 100
    set -g status-right-length 100
    set -g status-left '#{E:@catppuccin_status_session} '
    set -gF status-right '#{E:@catppuccin_status_ctp_cpu}'
    set -agF status-right '#{E:@catppuccin_status_ctp_memory}'
    set -ag status-right '#{E:@catppuccin_status_date_time}'
  '';
}
