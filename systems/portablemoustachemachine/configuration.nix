{ config, libs, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix

            ../../modules/nixos/tmux/tmux.nix

            ../../modules/nixos/essentials.nix
            ../../modules/nixos/optional.nix 
        ];

    powerManagement.enable = true;
    systemd.sleep.extraConfig = ''
        HibernateDelaySec=30m
        SuspendState=mem
    '';

    boot.resumeDevice = "/dev/disk/by-uuid/80cdbd3a-5694-4f49-ac7b-b21b753a6429";

    gamingMode.enable = false;

    services.logind.extraConfig = ''
         HandlePowerKey=ignore
    '';

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

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
        extraGroups = [ "wheel" "keyd" "video" ];
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
        bitwarden
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
        linuxHeaders
        live-server
        lua51Packages.lua
        maven
        neovim
        nfs-utils
        nodejs_24
        nwg-look
        php
        php84Packages.composer
        pipe-viewer
        pnpm
        powerline-go
        prismlauncher
        pwvucontrol
        python3
        pywal
        rpi-imager
        ruby
        sqlite
        sqlitestudio
        swww
        tesseract
        tigervnc
        trash-cli
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
        thermald.enable = true;
        tlp = {
            enable = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
                CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

                CPU_MIN_PERF_ON_AC = 0;
                CPU_MAX_PERF_ON_AC = 100;
                CPU_MIN_PERF_ON_BAT = 0;
                CPU_MAX_PERF_ON_BAT = 20;

                #Optional helps save long term battery health
                START_CHARGE_THRESH_BAT0 = 15; # 40 and below it starts to charge
                STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging

            };
        };
    };
    powerManagement.powertop.enable = true;

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

