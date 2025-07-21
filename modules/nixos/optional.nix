{config, pkgs, lib, ... }:

{
  imports = [
    ./plasma/plasma.nix
    ./steam.steam.nix
  ];
}
