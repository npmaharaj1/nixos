{ pkgs, config, lib, ... }:

{
  options = {
    lyModule.enable = lib.mkEnableOption "enables lyModule";
  };

  config = lib.mkIf config.lyModule.enable {
    services = {
      displayManager.ly.enable = true;
    };
  };
}
