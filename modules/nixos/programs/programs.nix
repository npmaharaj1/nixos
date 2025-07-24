{ pkgs, config, lib, ... }:

{
  programs = {
    zsh.enable = true;
    thunar.enable = true;
    tmux.enable = true;

    nh = {
      enable = true;
      flake = "/home/nishant/Projects/nixos/";
    };

    ssh = {
      extraConfig = ''
        Host github
          Hostname github.com
          IdentityFile /home/nishant/.ssh/id_rsa
          IdentitiesOnly yes
      '';
    };

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Hyprland Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
