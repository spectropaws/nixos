{ config, pkgs, ... }:

{
  services.swww.enable = true;

  # systemd.user.services.swww = {
  #   description = "swww Daemon";

  #   Unit = {
  #     Description = "swww daemon";
  #     PartOf = [ "graphical-session.target" ];
  #     After = [ "graphical-session.target" ];
  #   };

  #   Service = {
  #     ExecStart = "${pkgs.swww}/bin/swww-daemon";
  #     ExecStop = "${pkgs.swww}/bin/swww stop";
  #   };

  #   Install = {
  #     WantedBy = [ "graphical-session.target" ];
  #   };
  # };
}
