{config, pkgs, lib, ... }:

{
  imports = [
    ./plasma/plasma.nix
    ./steam/steam.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };

  steamModule.enable = lib.mkIf config.gamingMode.enable true;
  plasmaModule.enable = lib.mkIf config.gamingMode.enable true;
}
