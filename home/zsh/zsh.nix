{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls -a --color=auto";
      lsl = "tree";
      mkdir = "mkdir -p";

      vim = "nvim";
    };

    sessionVariables = {
      NH_FLAKE = "/home/nishant/Projects/nixos/";
      XDG_CONFIG_HOME = "/home/nishant/.config/";
    };

    envExtra = "wal -i $(cat /home/nishant/.cache/swww/eDP-1) -q";
  };
}

