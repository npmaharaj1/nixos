{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        settings.user = {
            name = "Nishant Maharaj";
            email = "git@thesubwave.net";
        };
    };
}
