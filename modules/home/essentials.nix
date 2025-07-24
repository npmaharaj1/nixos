{ pkgs, config, lib, ... }:

{
  imports = [
    ./alacritty/alacritty.nix
    ./git/git.nix
    ./librewolf/librewolf.nix
    ./ssh/ssh.nix
    ./zoxide/zoxide.nix
    ./zsh/zsh.nix
  ]; 
}
