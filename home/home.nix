{ config, pkgs, ... }:

{
  imports = [
    ./librewolf/librewolf.nix
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./zoxide/zoxide.nix
    ./zsh/zsh.nix
    ./hypr/hyprland.nix
    ./hypr/hyprpanel.nix
    ./fuzzel/fuzzel.nix
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
