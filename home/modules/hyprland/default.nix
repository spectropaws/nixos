{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = ",preferred,auto,1";

      exec-once = [
        "dunst"
        "nm-applet --indicator"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "swww-daemon"
        "swww img /home/spectropaws/Downloads/wallpapers/wallhaven-w557rr.jpg"
        # propagate env vars to systemd so waybar/gsettings etc. work
        # "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      "$mod"         = "SUPER";
      "$terminal"    = "kitty";
      "$fileManager" = "nautilus";
      "$menu"        = "rofi -show drun -show-icons";

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout    = "us";
        follow_mouse = 1;
        sensitivity  = 0;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in  = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border"   = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing    = false;
        layout           = "dwindle";
      };

      decoration = {
        rounding         = 10;
        active_opacity   = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled      = true;
          range        = 4;
          render_power = 3;
          color        = "rgba(1a1a1aee)";
        };

        blur = {
          enabled   = true;
          size      = 3;
          passes    = 1;
          vibrancy  = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier  = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows,     1, 7, myBezier"
          "windowsOut,  1, 7, default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile     = true;
        preserve_split = true;
      };

      master.new_status = "master";

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo   = true;
      };

      # ── Window rules (0.48+ syntax) ──────────────────────────────
      # windowrulev2 is fully deprecated as of 0.53.0
      # new syntax: windowrule = <rule> on, match:class <regex>
      # multiple rules can be chained on one line per match
      windowrule = [
        # suppress unwanted maximize requests from all windows
        "match:class .*, suppress_event maximize"

        # float specific apps
        "float on, match:class ^(pavucontrol)$"
        "float on, match:class ^(nm-connection-editor)$"

        # Nautilus dialogs — group with named rule for clarity
        "float on, match:class ^(org\\.gnome\\.Nautilus)$, match:title ^(File Operation Progress)$"
        "float on, match:class ^(org\\.gnome\\.Nautilus)$, match:title ^(Confirm to replace files)$"
        "float on, match:class ^(org\\.gnome\\.Nautilus)$, match:title ^(Properties)$"

        # generic "Open with..." dialogs
        "float on, match:title ^(Open with\\.\\.\\.)$"
      ];

      # ── Keybindings ──────────────────────────────────────────────
      bind = [
        "$mod, Return,  exec, $terminal"
        "$mod, E,       exec, $fileManager"
        "$mod, Space,   exec, $menu"
        "$mod, V,       exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, period,  exec, bemoji -c"
        "$mod, Escape, exec, powermenu"


        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, F, fullscreen"
        "$mod, T, togglefloating"
        "$mod, P, pseudo"
        "$mod, J, layoutmsg, togglesplit"

        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"
        "$mod, h,     movefocus, l"
        "$mod, l,     movefocus, r"
        "$mod, k,     movefocus, u"
        "$mod, j,     movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, S,       togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up,   workspace, e-1"

        ''  , Print,       exec, grim -g "$(slurp)" - | swappy -f -''
        ''SHIFT, Print,    exec, grim - | swappy -f -''
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioMute,  exec, pamixer -t"
        ", XF86AudioPlay,  exec, playerctl play-pause"
        ", XF86AudioNext,  exec, playerctl next"
        ", XF86AudioPrev,  exec, playerctl previous"
      ];

      bindle = [
        ", XF86AudioRaiseVolume,   exec, pamixer -i 5"
        ", XF86AudioLowerVolume,   exec, pamixer -d 5"
        ", XF86MonBrightnessUp,    exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown,  exec, brightnessctl set 5%-"
      ];
    };
  };
}
