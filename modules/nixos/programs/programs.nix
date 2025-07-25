{ pkgs, config, lib, inputs, ... }:

{
  programs = {
    zsh.enable = true;
    thunar.enable = true;
    tmux.enable = true;

    nh = {
      enable = true;
      flake = "/home/nishant/Projects/nixos/";
    };

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    nix-ld = {
      enable = true;
    };
  };

  # Hyprland Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
