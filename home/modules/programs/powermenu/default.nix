{ pkgs, config, ... }:

let
  powermenuScript = pkgs.writeShellScript "powermenu" ''
    chosen=$(printf "󰌾 Lock\n󰤄 Suspend\n󰒲 Hibernate\n󰍃 Logout\n󰑓 Reboot\n󰐥 Shutdown" \
      | rofi \
          -dmenu \
          -theme ${config.home.homeDirectory}/.config/rofi/powermenu.rasi \
          -p "  spectropaws" \
          -mesg "$(date '+%A, %d %B  %H:%M')" \
          -no-fixed-num-lines \
          -width 20)

    case "$chosen" in
      *Lock*)      loginctl lock-session ;;
      *Suspend*)   systemctl suspend ;;
      *Hibernate*) systemctl hibernate ;;
      *Logout*)    hyprctl dispatch exit ;;
      *Reboot*)    systemctl reboot ;;
      *Shutdown*)  systemctl poweroff ;;
    esac
  '';
in
{
  # Deploy the rasi theme
  home.file.".config/rofi/powermenu.rasi".source = ./powermenu.rasi;

  # Make the script available in PATH
  home.packages = [
    (pkgs.writeShellScriptBin "powermenu" (builtins.readFile powermenuScript))
  ];
}
