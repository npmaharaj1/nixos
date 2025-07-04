{ config, pkgs, ... }:

{
  imports = [
    ./librewolf/librewolf.nix
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./zoxide/zoxide.nix
    ./zsh/zsh.nix
  ];

  home.username = "nishant";
  home.homeDirectory = "/home/nishant";

  home.packages = with pkgs; [
    # terminal / tui
    btop
    fastfetch
    htop
    nnn
  ];

  home.stateVersion = "25.05";
}
