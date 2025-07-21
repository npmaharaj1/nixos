{ pkgs, lib, config, ... }:

{
  options = {
    steamModule.enable = lib.mkEnableOption "enables steamModule";
  };

  config = lib.mkIf config.steamModule.enable {
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
