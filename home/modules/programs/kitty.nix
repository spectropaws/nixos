{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      # Theme - Catppuccin Mocha
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      
      # Cursor
      cursor = "#f5e0dc";
      cursor_text_color = "#1e1e2e";
      
      # Selection
      selection_foreground = "#1e1e2e";
      selection_background = "#f5e0dc";
      
      # URL
      url_color = "#89b4fa";
      
      # Black
      color0 = "#45475a";
      color8 = "#585b70";
      
      # Red
      color1 = "#f38ba8";
      color9 = "#f38ba8";
      
      # Green
      color2 = "#a6e3a1";
      color10 = "#a6e3a1";
      
      # Yellow
      color3 = "#f9e2af";
      color11 = "#f9e2af";
      
      # Blue
      color4 = "#89b4fa";
      color12 = "#89b4fa";
      
      # Magenta
      color5 = "#f5c2e7";
      color13 = "#f5c2e7";
      
      # Cyan
      color6 = "#94e2d5";
      color14 = "#94e2d5";
      
      # White
      color7 = "#bac2de";
      color15 = "#a6adc8";

      # Window
      window_padding_width = 10;
      confirm_os_window_close = 0;
      
      # Tab bar
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      
      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";
      
      # Misc
      enable_audio_bell = "no";
      visual_bell_duration = 0;
      window_alert_on_bell = "no";
      bell_on_tab = "no";
    };
  };
}
