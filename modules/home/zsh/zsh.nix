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
      nurse = "nh os switch && ~/Projects/nixos/modules/home/templates/start.sh";
      dev-commit = "cd ~/Projects/nixos && git add . && git commit -m 'automated commit' && git push origin master && cd ~/Projects/school-stuff && git add . && git commit -m 'automated commit' && git push origin master && cd ~/.config/nvim && git add . && git commit -m 'automated commit' && git push origin master";

    };

    sessionVariables = {
      NH_FLAKE = "/home/nishant/Projects/nixos/";
      XDG_CONFIG_HOME = "/home/nishant/.config/";
    };

    envExtra = "wal -i $(cat /home/nishant/.cache/swww/*) -q";
  };
}

