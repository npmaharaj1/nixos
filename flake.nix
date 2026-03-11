{
    description = "A simple NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    };

    outputs = { nixpkgs, home-manager, nixpkgs-unstable, ... } @ inputs: 
        let
            username = "nishant";
            system="x86_64-linux";
        in
            {
            # System Stuff
            nixosConfigurations = {

                portablemoustachemachine = nixpkgs.lib.nixosSystem {
                    specialArgs = let
                        system = "x86_64-linux";
                    in {
                        inherit inputs;
                        pkgs-stable = import nixpkgs {
                            inherit system;
                            config.allowUnfree = true;
                        };

                        pkgs-unstable = import nixpkgs-unstable {
                            inherit system;
                            config.allowUnfree = true;
                        };
                    };

                    modules = [
                        { nixpkgs = { inherit system; config.allowUnfree = true; }; }
                        ./systems/portablemoustachemachine/configuration.nix

                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;

                            home-manager.users.nishant = import ./systems/parent-home.nix;
                        }
                    ];
                };

                moustachemachine = nixpkgs.lib.nixosSystem {
                    specialArgs = let
                        system = "x86_64-linux";
                        nixpkgsConfig = {
                            allowUnfree = true; 
                        };
                    in {
                        inherit inputs;
                        pkgs-stable = import nixpkgs {
                            inherit system;
                            config.allowUnfree = true;
                        };

                        pkgs-unstable = import nixpkgs-unstable {
                            inherit system;
                            config.allowUnfree = true;
                        };

                        # pkgs = import nixpkgs {
                        #     inherit system;
                        #     config.allowUnfree = true;
                        # };
                    };

                    modules = [
                        { nixpkgs = { inherit system; config.allowUnfree = true; }; }
                        ./systems/moustachemachine/configuration.nix

                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;

                            home-manager.users.nishant = import ./systems/parent-home.nix;
                        }
                    ];
                };
            };
        };
}
