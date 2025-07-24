{ pkgs, config, lib, ... }:

{
  options = {
    plasmaModule.enable = lib.mkEnableOption "enables plasmaModule";
  };

  config = lib.mkIf config.plasmaModule.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };
  };
}
