{ config, pkgs, ... }:

{
  home.username = "nishant";
  home.homeDirectory = "/home/nishant";

  home.packages = with pkgs; [
    # terminal / tui
    btop
    fastfetch
    htop
    nnn
  ];

  programs.git = {
    enable = true;
    userName = "Nishant";
    userEmail = "npmaharaj1@protonmail.com";
  };

  programs.alacritty = {
    enable = true;
    # settings = {
    #   ...
    # };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "ls -a";
    };
  };

  home.stateVersion = "25.05";
}
