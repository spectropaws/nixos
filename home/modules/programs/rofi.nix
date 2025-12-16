{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    # package = pkgs.rofi-wayland;
    
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus";
      display-drun = " Apps";
      display-run = " Run";
      display-window = " Window";
      drun-display-format = "{name}";
      window-format = "{w} · {c} · {t}";
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#1e1e2e";
        bg-alt = mkLiteral "#313244";
        fg = mkLiteral "#cdd6f4";
        fg-alt = mkLiteral "#a6adc8";
        
        border = mkLiteral "#89b4fa";
        selected = mkLiteral "#89b4fa";
        
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg";
      };

      "window" = {
        transparency = "real";
        background-color = mkLiteral "@bg";
        border = mkLiteral "2px";
        border-color = mkLiteral "@border";
        border-radius = mkLiteral "10px";
        width = mkLiteral "600px";
      };

      "mainbox" = {
        padding = mkLiteral "12px";
      };

      "inputbar" = {
        background-color = mkLiteral "@bg-alt";
        border-radius = mkLiteral "8px";
        padding = mkLiteral "10px";
        spacing = mkLiteral "10px";
        children = mkLiteral "[prompt, entry]";
      };

      "prompt" = {
        text-color = mkLiteral "@selected";
      };

      "entry" = {
        placeholder = "Search...";
        placeholder-color = mkLiteral "@fg-alt";
      };

      "listview" = {
        columns = 1;
        lines = 8;
        cycle = false;
        dynamic = true;
        scrollbar = true;
        layout = mkLiteral "vertical";
        spacing = mkLiteral "5px";
        margin = mkLiteral "10px 0 0 0";
      };

      "element" = {
        padding = mkLiteral "8px";
        border-radius = mkLiteral "6px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@bg";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        margin = mkLiteral "0 10px 0 0";
      };

      "element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      "scrollbar" = {
        width = mkLiteral "4px";
        handle-width = mkLiteral "4px";
        handle-color = mkLiteral "@selected";
        padding = mkLiteral "0 0 0 4px";
      };
    };
  };
}
