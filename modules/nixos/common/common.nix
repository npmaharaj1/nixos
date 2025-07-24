{ pkgs, config, lib, ... }:

{
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default

# Set your time zone.
    time.timeZone = "Australia/Canberra";

    services = {
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
    };

}
