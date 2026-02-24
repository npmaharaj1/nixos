{ pkgs, lib, ... }:

{
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default

# Set your time zone.
        time.timeZone = "Australia/Canberra";

    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings = {
            General = {
# Shows battery charge of connected devices on supported
# Bluetooth adapters. Defaults to 'false'.
                Experimental = true;
# When enabled other devices can connect faster to us, however
# the tradeoff is increased power consumption. Defaults to
# 'false'.
                FastConnectable = true;
            };
            Policy = {
# Enable all controllers when they are found. This includes
# adapters present on start as well as adapters that are plugged
# in later on. Defaults to 'true'.
                AutoEnable = true;
            };
        };
    };
    hardware.graphics.enable32Bit = true;

    services = {
        gnome.gnome-keyring.enable = true;
        getty.helpLine = lib.mkForce "";
        nfs.server.enable = true;
        rpcbind.enable = true;

# Enable sound
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        printing.enable = true;

# Enable touchpad support (enabled default in most desktopManager).
        libinput.enable = true;

        logind = {
            settings.Login.HandleLidSwitch = "hibernate";
        };

        gvfs = {
            enable = true;
            package = lib.mkForce pkgs.gnome.gvfs;
        };
        samba.enable = true;
    };

    virtualisation = {
        docker.enable = true;
    };

}
