{ config, libs, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../modules/nixos/tmux/tmux.nix

      ../../modules/nixos/essentials.nix
      ../../modules/nixos/optional.nix 
    ];

  gamingMode.enable = false;

  services.logind.extraConfig = ''
     HandlePowerKey=ignore
  '';

# Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "portablemoustachemachine"; # Define your hostname.

  users.users.nishant = {
    isNormalUser = true;
    extraGroups = [ "wheel" "keyd" ];
    packages = with pkgs; [
      fd
        gnumake
        luarocks
        ripgrep
        tree
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  environment.systemPackages = with pkgs; [
    alacritty
      brightnessctl
      cachix
      cargo
      fuzzel
      gcc
      grayjay
      grim
      go
      heroic
      hplip
      hyprpanel
      jetbrains.idea-community
      jdk24
      julia
      libnotify
      localsend
      lua51Packages.lua
      maven
      neovim
      nodejs_24
      php
      php84Packages.composer
      prismlauncher
      pwvucontrol
      python3
      pywal
      ruby
      swww
      tree
      tree-sitter
      unzip
      waypaper
      wget
      wl-clipboard
      zip

#flake
      inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

  programs = {
    fcast-receiver = {
      enable = true;
      openFirewall = true;
    };

  };

# List services that you want to enable:

  services = {
    upower.enable = true;
  };

# Open ports in the firewall.
networking.firewall.allowedTCPPorts = [ 9100 ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

