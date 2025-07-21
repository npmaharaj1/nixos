{ pkgs, lib, config, ... }:

{
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    settings.auto-optimise-store = true;
  };

  home-manager.backupFileExtension = "hm-backup";
}
