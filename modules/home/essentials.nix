{ pkgs, config, lib, ... }:

{
  imports = [
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./librewolf/librewolf.nix
    ./zoxide/zoxide.nix
    ./zsh/zsh.nix
  ]; 
}
