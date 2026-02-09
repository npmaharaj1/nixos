{ lib, pkgs, ... }:

{
    imports = [ ../../modules/home ];


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
