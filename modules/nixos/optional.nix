{config, pkgs, lib, ... }:

{
  imports = [
    ./displaymanager/ly.nix
    ./displaymanager/plasma.nix
    ./steam/steam.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };

  config = {
    lyModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    plasmaModule.enable = lib.mkIf config.gamingMode.enable true;
    steamModule.enable = lib.mkIf config.gamingMode.enable true;
  };
}
