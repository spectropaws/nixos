{ pkgs, ... }:

let
  catppuccinPlugin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "main";
      sha256 = "sha256-godCgBMgqzim+W3O2sHcgw91h7sHsKHjd02BdLuazZ8=";
    };
  };
in
{
  programs.tmux.extraConfig = ''
    # Catppuccin theme
    set -g @catppuccin_flavor "mocha"
    set -g @catppuccin_window_status_style "custom"
    # Make the status line pretty and add some modules
    set -g @catppuccin_window_number_position 'right'
    set -g @catppuccin_window_status "no"
    set -g @catppuccin_window_default_text ' #W'
    set -g @catppuccin_window_current_fill 'all'
    set -g @catppuccin_window_current_text ' #W'
    set -g @catppuccin_window_current_color '#{E:@thm_surface_2}'
    set -g @catppuccin_window_text " #W"
    set -g @catppuccin_date_time_text ' %d.%m. %H:%M'
    set -g @catppuccin_status_fill "icon"
    set -g @catppuccin_status_background 'none'
    set -g @catppuccin_status_left_separator " "
    set -g @catppuccin_status_middle_separator ""
    set -g @catppuccin_status_right_separator " "
    set -g @catppuccin_status_connect_separator "no"
    set -g @catppuccin_status_module_text_bg '#{E:@thm_mantle}'
    set -g @catppuccin_status_module_bg_color "#{@thm_surface_0}"

    # Default window colors - Left
    set -g @catppuccin_window_text_color "#{@thm_surface_0}"
    set -g @catppuccin_window_left_separator "#[fg=#{@thm_surface_0},bg=default]#[bg=default,fg=#{@thm_surface_0}]"
    set -g @catppuccin_window_middle_separator "#[fg=#{@thm_surface_0},bg=default]█#[bg=default,fg=#{@thm_surface_0}]"

    # Default window colors - Right
    set -g @catppuccin_window_number_color "#{@thm_lavender}"
    set -g @catppuccin_window_right_separator "#[bg=default,fg=#{@thm_lavender}]#[bg=default,fg=#{@thm_lavender}]"

    # Current window colors - Left
    set -g @catppuccin_window_current_text_color "#{@thm_surface_1}"
    set -g @catppuccin_window_current_left_separator "#[fg=#{@thm_surface_1},bg=default]#[bg=default,fg=#{@thm_surface_1}]"
    set -g @catppuccin_window_current_middle_separator "#[fg=#{@thm_surface_1},bg=default]█#[bg=default,fg=#{@thm_surface_1}]"

    # Current window colors - Right
    set -g @catppuccin_window_current_number_color "#{@thm_mauve}"
    set -g @catppuccin_window_current_right_separator "#[bg=default,fg=#{@thm_mauve}]#[bg=default,fg=#{@thm_mauve}]"

    # Must run BEFORE status bar modules
    run-shell ${catppuccinPlugin}/share/tmux-plugins/catppuccin/catppuccin.tmux
  '';
}
