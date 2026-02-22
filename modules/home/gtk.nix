{ pkgs, ... }:

{
    gtk = {
        enable = true;
        gtk3.extraConfig = {
            theme = "Tokyonight-Dark";
            package = "pkgs.tokyonight-gtk-theme";
            Settings = ''
                gtk-application-prefer-dark-theme=1
                '';
        };

        gtk4.extraConfig = {
            theme = "Tokyonight-Dark";
            package = "pkgs.tokyonight-gtk-theme";
            Settings = ''
                gtk-application-prefer-dark-theme=1
                '';
        };

        theme = {
            name = "Tokyonight-Dark";
            package = pkgs.tokyonight-gtk-theme;
        };

    };
}
