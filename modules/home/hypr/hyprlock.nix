{ pkgs, config, lib, ... }:

{
    options = {
        hyprlockModule.enable = lib.mkEnableOption "enables hyprlockModule";
    };

    config = lib.mkIf config.hyprlockModule.enable {
        programs.hyprlock = {
            enable = true;

            # settings = {
            #
            # };
        };
    };
}
