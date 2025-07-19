{
  description = "A simple NixOS flake";

  inputs = {
# Official NixOS Source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

# Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

# Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, plasma-manager, ... } @ inputs: 
  let
    username = "nishant";
    system="x86_64-linux";
  in
  {
# System Stuff
    nixosConfigurations = {

      portablemoustachemachine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./systems/portablemoustachemachine/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.nishant = import ./systems/portablemoustachemachine/home.nix;
        }
        ];
      };

      moustachemachine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./systems/moustachemachine/configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.nishant = import ./systems/moustachemachine/home.nix;
        }
        ];
      };
    };
  };
}
