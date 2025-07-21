{ pkgs, ... }:

{
  imports = [
    ./boot/boot.nix
    ./common/common.nix
    ./keyd/keyd.nix
    ./programs/programs.nix
    ./scheduled/scheduled.nix
  ];
}
