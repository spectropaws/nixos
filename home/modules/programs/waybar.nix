{ config, pkgs, ... }:
 let
  gsettings = "${pkgs.glib}/bin/gsettings";
  darkModeScript = pkgs.writeShellScript "toggle-darkmode" ''
    current=$(${gsettings} get org.gnome.desktop.interface color-scheme)
    if [ "$current" = "'prefer-dark'" ]; then
      ${gsettings} set org.gnome.desktop.interface color-scheme 'prefer-light'
      ${gsettings} set org.gnome.desktop.interface gtk-theme 'Adwaita'
    else
      ${gsettings} set org.gnome.desktop.interface color-scheme 'prefer-dark'
      ${gsettings} set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    fi
  '';
  darkModeStatus = pkgs.writeShellScript "darkmode-status" ''
    if [ "$(${gsettings} get org.gnome.desktop.interface color-scheme)" = "'prefer-dark'" ]; then
      # Echo the moon icon for dark mode
      echo "" 
    else
      # Echo the sun icon for light mode
      echo "" 
    fi
  '';
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "custom/darkmode" "pulseaudio" "network" "cpu" "memory" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          format = "{}";
          separate-outputs = true;
          max-length = 50;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        cpu = {
          format = " {usage}%";
          tooltip = false;
	  interval = 2;
        };

        memory = {
          format = " {}%";
	  interval = 2;
        };

        battery = {
          interval = 10;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  wired";
          format-disconnected = "⚠ Disconnected";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = " muted";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ]; 
          };
          on-click = "pavucontrol";
        };

	"custom/darkmode" = {
          format = "{}";
          exec = "${darkModeStatus}";
          interval = 2;
          on-click = "${darkModeScript}";
          tooltip = false;
        };

        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 8px;
        color: #cdd6f4;
        background-color: transparent;
        box-shadow: inset 0 -3px transparent;
      }

      #workspaces button.active {
        background-color: rgba(137, 180, 250, 0.3);
        box-shadow: inset 0 -3px #89b4fa;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #workspaces button:hover {
        background: rgba(137, 180, 250, 0.2);
      }

      #window {
        margin: 0 10px;
        color: #89b4fa;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 10px;
        margin: 0 2px;
      }

      #clock {
        color: #89dceb;
        font-weight: bold;
      }

      #battery {
        color: #a6e3a1;
      }

      #battery.charging {
        color: #a6e3a1;
      }

      #battery.warning:not(.charging) {
        color: #f9e2af;
      }

      #battery.critical:not(.charging) {
        color: #f38ba8;
      }

      #cpu {
        color: #f9e2af;
      }

      #memory {
        color: #cba6f7;
      }

      #network {
        color: #fab387;
      }

      #pulseaudio {
        color: #89b4fa;
      }

      #pulseaudio.muted {
        color: #6c7086;
      }

      #tray {
        padding: 0 5px;
      }

      #custom-darkmode {
  	color: #f9e2af;
  	padding: 0 10px;
  	margin: 0 2px;
      }
    '';
  };
}
