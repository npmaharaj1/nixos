{
    description = "A simple NixOS flake";

    inputs = {
        # Official NixOS Source
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    outputs = { self, nixpkgs, ... } @ inputs: {
        nixosConfigurations.portablemoustachemachine = nixpkgs.lib.nixosSystem {
	    system = "x86_64-linux";
	    modules = [
	        ./configuration.nix
	    ];
	};
    };
}
