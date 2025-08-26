{ config, pkgs, lib, ... }:

{
    options = {
        gtkModule.enable = lib.mkEnableOption "Enable GTK and themes and stuff";
    };

    config = lib.mkIf config.gtkModule.enable {
        gtk = {
            enable = true;
            gtk3.extraConfig = {
                Settings = ''
                    gtk-application-prefer-dark-theme=1
                '';
            };

            gtk4.extraConfig = {
                Settings = ''
                    gtk-application-prefer-dark-theme=1
                '';
            };

            theme = {
                name = "Tokyonight-Dark";
                package = pkgs.tokyonight-gtk-theme;
            };

        };
    };
}
