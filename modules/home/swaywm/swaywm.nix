{ config, lib, pkgs, ... }:

{
    options = {
        swaywmModule.enable = lib.mkEnableOption "enables swaywmModule";
    };

    config = lib.mkIf config.swaywmModule.enable {
        wayland.windowManager.sway = {
            enable = true;
            config = rec {
                modifier = "Mod4";
                terminal = "alacritty"; 
                startup = [
                    {command = "librewolf";}
                ];
            };
        };
    };
}
