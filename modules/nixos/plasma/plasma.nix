{ pkgs, config, lib, ... }:

{
  # options = {
    gamingmode.enable = lib.mkEnableOption "enables gamingmode";
  # };

  # config = lib.mkIf config.gamingmode.enable {
    programs = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };
  # };
}
