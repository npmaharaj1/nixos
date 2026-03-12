{ config, pkgs-stable, ... }:

{
    imports = [
        ../parent-configuration.nix
        ./hardware-configuration.nix
    ];

    boot.kernelPackages = pkgs-stable.linuxPackages;

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        #nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    networking.hostName = "moustachemachine";

    services.ratbagd.enable = true;

    networking.firewall.enable = false;
}
