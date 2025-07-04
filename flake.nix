{
    description = "A simple NixOS flake";

    inputs = {
        # Official NixOS Source
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

	# Hyprland
	hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, ... } @ inputs: {
        nixosConfigurations.portablemoustachemachine = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    specialArgs = { inherit inputs; };
	    modules = [
	        ./configuration.nix
	    ];
	};
    };
}
