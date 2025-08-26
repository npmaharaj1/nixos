{ config, lib, pkgs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./waybar/waybar.nix
    ./fuzzel/fuzzel.nix
    ./gtk/gtk.nix
  ];

  options = {
    gamingMode.enable = lib.mkEnableOption "enables gamingMode";
  };

  config = {
    hyprModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    waybarModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    fuzzelModule.enable = lib.mkIf (!config.gamingMode.enable) true;
    gtkModule.enable = lib.mkIf (!config.gamingMode.enable) true;
  };
}
