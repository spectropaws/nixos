{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.spectropaws = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}
