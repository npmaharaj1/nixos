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
    };

    outputs = { nixpkgs, home-manager, ... } @ inputs: {
        nixosConfigurations = {
          portablemoustachemachine = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    specialArgs = { inherit inputs; };
	    modules = [
	        ./systems/portablemoustachemachine/configuration.nix

	        home-manager.nixosModules.home-manager
		{
		  home-manager.useGlobalPkgs = true;
		  home-manager.useUserPackages = true;

		  home-manager.users.nishant = import ./home/home.nix;
		}
	    ];
	  };
	};
    };
}
