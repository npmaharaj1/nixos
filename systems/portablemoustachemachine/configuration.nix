{ config, libs, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;

# Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "weekly";
    randomizedDelaySec = "45min";
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

  networking.hostName = "portablemoustachemachine"; # Define your hostname.
# Pick only one of the below networking options.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
    time.timeZone = "Australia/Canberra";

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

# Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {

          main = {
            rightshift = "rightshift";
            capslock = "layer(meta)";
          };
        };
        extraConfig = ''

          leftshift+rightshift = capslock

          '';
      };
    };
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
      MatchName=keyd virtual keyboard
      AttrKeyboardIntegration=internal
      '';

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
      go
      grayjay
      hyprpanel
      julia
      libnotify
      localsend
      lua51Packages.lua
      maven
      neovim
      nodejs_24
      openjdk
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
      ];

  programs = {
    zsh.enable = true;
    thunar.enable = true;
    tmux.enable = true;
    fcast-receiver.enable = true;

    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    nh = {
      enable = true;
      flake = "/home/nishant/nixos/";
    };
  };

# Hyprland Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

# List services that you want to enable:

  services = {
    displayManager.ly.enable = true;
  };

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
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

