{config, pkgs, lib, ... }:

{
  imports = [
    ./displaymanager/ly.nix
    ./displaymanager/plasma.nix
    ./steam/steam.nix
    ./gpu-screen-recorder/gpu-screen-recorder.nix
    ./swaywm/swaywm.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };

  config = {
    swaywmModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    lyModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    plasmaModule.enable = lib.mkIf config.gamingMode.enable true;
    recorderModule.enable = lib.mkIf config.gamingMode.enable true;
    steamModule.enable = lib.mkIf config.gamingMode.enable true;
  };
}
