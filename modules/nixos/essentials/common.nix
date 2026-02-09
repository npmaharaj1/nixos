{ pkgs, config, lib, ... }:

{
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default

    # Set your time zone.
    time.timeZone = "Australia/Canberra";

    hardware.bluetooth.enable = true;
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
