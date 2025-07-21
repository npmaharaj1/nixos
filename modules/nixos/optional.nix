{config, pkgs, lib, ... }:

{
  imports = [
    ./plasma/plasma.nix
    ./steam/steam.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };
}
