{ pkgs, lib, config, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;

  # Use latest kernel. Comment if on nVidia
  #boot.kernelPackages = pkgs.linuxPackages_latest;
}
