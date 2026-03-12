{
  description = "spectropaws' Workstation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs : {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
	{ nixpkgs.hostPlatform = "x86_64-linux"; }

        ./hosts/default/configuration.nix

        home-manager.nixosModules.home-manager 
        {
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
	  home-manager.users.spectropaws = import ./home/home.nix;
        }
      ];
    };
  };
}
