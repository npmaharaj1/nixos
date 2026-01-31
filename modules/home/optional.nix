{ config, lib, pkgs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./swaywm/swaywm.nix
    ./waybar/waybar.nix
    ./fuzzel/fuzzel.nix
    ./gtk/gtk.nix
    # ./hypr/hyprlock.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };

  config = {
    hyprlandModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    swaywmModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    # hyprlockModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    waybarModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    fuzzelModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    gtkModule.enable = lib.mkIf (!config.gamingMode.enable) true;
  };
}
