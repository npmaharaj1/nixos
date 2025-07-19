{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls -a --color=auto";
      lsl = "tree";
      mkdir = "mkdir -p";
      wheel = " sudo usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01  ";
      vim = "nvim";
    };

    sessionVariables = {
      NH_FLAKE = "/home/nishant/Projects/nixos/";
      XDG_CONFIG_HOME = "/home/nishant/.config/";
    };

    envExtra = "wal -i $(cat /home/nishant/.cache/swww/eDP-1) -q";
  };
}

