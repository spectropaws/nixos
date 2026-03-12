{ ... }:

{
  imports = [
    ./swww.nix
    ./dunst.nix
  ];

  # Enable home-manager services
  services = {
    # Clipboard manager
    cliphist.enable = true;
  };
}
