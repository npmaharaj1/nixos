{ config, pkgs, ... }:

{
  imports = [
    # ../../modules/home/librewolf/librewolf.nix
    # ../../modules/home/alacritty/alacritty.nix
    # ../../modules/home/git/git.nix
    # ../../modules/home/zoxide/zoxide.nix
    # ../../modules/home/zsh/zsh.nix

    ../../modules/home/essentials.nix
    ../../modules/home/optional.nix 
  ];

  home.username = "nishant";
  home.homeDirectory = "/home/nishant";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

# terminal / tui
    btop
    fastfetch
    htop
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "25.05";
}
