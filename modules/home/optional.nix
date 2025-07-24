{ config, lib, pkgs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./hypr/hyprpanel.nix
    ./waybar/waybar.nix
    ./fuzzel/fuzzel.nix
  ];
}
