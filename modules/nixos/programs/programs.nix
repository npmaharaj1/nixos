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

    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
