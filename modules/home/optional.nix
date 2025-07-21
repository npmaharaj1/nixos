{ config, lib, pkgs, ... }:

{
  imports = [
    ./hypr/hyprland.nix
    ./hypr/hyprpanel.nix
    ./fuzzel/fuzzel.nix
  ];
}
