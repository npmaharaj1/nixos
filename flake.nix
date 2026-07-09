{
    description = "A simple NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
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
                            config.allowBroken = true;
                            config.permittedInsecurePackages = [
                                "electron-39.8.10"
                            ];
                        };

                        pkgs-unstable = import nixpkgs-unstable {
                            inherit system;
                            config.allowUnfree = true;
                            config.allowBroken = true;
                            config.permittedInsecurePackages = [
                                "electron-39.8.10"
                            ];
                        };
                    };

                    modules = [
                        { nixpkgs = { inherit system; config.allowUnfree = true; config.allowBroken = true; }; }
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
                            allowBroken = true;
                        };
                    in {
                        inherit inputs;
                        pkgs-stable = import nixpkgs {
                            inherit system;
                            config.allowUnfree = true;
                            config.allowBroken = true;
                        };

                        pkgs-unstable = import nixpkgs-unstable {
                            inherit system;
                            config.allowUnfree = true;
                            config.allowBroken = true;
                        };
                    };

                    modules = [
                        { nixpkgs = { inherit system; config.allowUnfree = true; config.allowBroken = true; }; }
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
