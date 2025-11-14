{ pkgs, config, ... }: { imports =
        [ 
            ./hardware-configuration.nix 

            ../../modules/nixos/essentials.nix
            ../../modules/nixos/optional.nix 
        ];

    gamingMode.enable = true;

    hardware.graphics = {
        enable = true;
    };

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        #nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    networking = {
        hostName = "moustachemachine"; # Define your hostname.
        networkmanager.insertNameservers = [ 
            "10.1.1.241"
            "10.1.1.242"
        ];
        dhcpcd.extraConfig = ''
      nohook resolv.conf
        '';
    };

    users.users.nishant = {
        isNormalUser = true;
        extraGroups = [ "wheel" "keyd" "audio" ];
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
    nixpkgs.config.permittedInsecurePackages = [
        "mbedtls-2.28.10"
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];
    environment.systemPackages = with pkgs; [
        alacritty
        audacity
        bitwarden-desktop
        brightnessctl
        cachix
        cargo
        cifs-utils
        clang
        containerlab
        ffmpeg
        file
        fuzzel
        gcc
        gimp3
        git
        go
        grim
        heroic
        hplip
        hyprshot
        jetbrains.idea-community
        jq
        julia
        libnotify
        libreoffice
        live-server
        lua51Packages.lua
        maven
        mbedtls
        mcpelauncher-ui-qt
        mpv
        neovim
        nodejs_24
        openjdk
        openrgb-with-all-plugins
        oversteer
        php
        php84Packages.composer
        pipe-viewer
        pnpm
        prismlauncher
        protonup-qt
        pwvucontrol
        python3
        pywal
        ruby
        sof-firmware
        swww
        tokyonight-gtk-theme
        trash-cli
        tree
        tree-sitter
        unzip
        usb-modeswitch
        vesktop
        vlc
        waypaper
        wget
        wine
        wl-clipboard
        zip

        kdePackages.kcalc
        kdePackages.kcharselect
        kdePackages.kcolorchooser
        kdePackages.kdenlive
        kdePackages.kolourpaint
        kdePackages.ksystemlog
        kdePackages.qtwebsockets
        kdePackages.sddm-kcm
        kdePackages.wallpaper-engine-plugin
        kdiff3
        hardinfo2
        haruna
        wayland-utils
        python313Packages.ws4py
    ];

    # List services that you want to enable:
    services = {
        blueman.enable = true;
        hardware.openrgb = {
            enable = true;
            motherboard = "intel";
        };
    };


    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # # Or disable the firewall altogether.
    networking.firewall.enable = false;

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

