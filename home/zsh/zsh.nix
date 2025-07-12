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
	NH_FLAKE = "/home/nishant/nixos/";
    };
  };
}

