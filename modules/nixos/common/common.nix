{ pkgs, config, lib, ... }:

{
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default

# Set your time zone.
    time.timeZone = "Australia/Canberra";

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable sound.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

# Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
}
