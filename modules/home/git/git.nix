{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        settings.user = {
            name = "Nishant Maharaj";
            email = "npmaharaj1@protonmail.com";
        };
    };
}
