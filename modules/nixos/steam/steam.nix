{ pkgs, lib, config, ... }:

{
  options = {
    gamingmode.enable = lib.mkEnableOption "enables gamingmode";
  };

  config = lib.mkIf config.gamingmode.enable {
    programs = {
      gamemode.enable = true;

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };
  };
}
