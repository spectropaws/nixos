{ lib, config, pkgs, ... }:

{
  imports = [
    ./programs.nix
    ./services.nix
    ./packages.nix
    ./display.nix
    ./audio.nix
    ./fonts.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./hardware
  ];
}
