{ config, ... }:

{
    imports = [
        ../parent-configuration.nix
        ./hardware-configuration.nix
    ];

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
