{ config, pkgs, ... }:

{
  imports = [
    ../../home/librewolf/librewolf.nix
    ../../home/alacritty/alacritty.nix
    ../../home/git/git.nix
    ../../home/zoxide/zoxide.nix
    ../../home/zsh/zsh.nix
    ../../home/hypr/hyprland.nix
    ../../home/hypr/hyprpanel.nix
    ../../home/fuzzel/fuzzel.nix
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
