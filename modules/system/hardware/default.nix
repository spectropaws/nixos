{ lib, pkgs, config, ... }:

{
  imports = [
    ./bluetooth.nix
    ./nvidia.nix
  ];
}
