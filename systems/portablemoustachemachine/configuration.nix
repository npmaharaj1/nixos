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

    hardware = {
        bluetooth.enable = true;
    };

    networking = {
        hostName = "portablemoustachemachine"; # Define your hostname.
        # networkmanager.insertNameservers = [ 
        #     "10.1.1.90"
        # ];
        dhcpcd.extraConfig = ''
      nohook resolv.conf
        '';
    };

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
        clang
        ffuf
        fuzzel
        gcc
        glib
        grim
        go
        heroic
        hplip
        hyprpanel
        hyprshot
        jetbrains.idea-community
        jdk24
        julia
        libglibutil
        libnotify
        live-server
        lua51Packages.lua
        maven
        neovim
        nodejs_24
        nwg-look
        php
        php84Packages.composer
        pnpm
        prismlauncher
        pwvucontrol
        python3
        pywal
        rpi-imager
        ruby
        swww
        tesseract
        tigervnc
        tree
        tree-sitter
        unzip
        vesktop
        vimv
        waypaper
        wget
        wl-clipboard
        zathura
        zip

        kdePackages.kdenlive
        libsForQt5.umbrello

        llvmPackages_latest.lldb
        llvmPackages_latest.libllvm
        llvmPackages_latest.libcxx
        llvmPackages_latest.clang
    ];

    # List services that you want to enable:

    services = {
        upower.enable = true;
        blueman.enable = true;
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

