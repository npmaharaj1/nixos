{ lib, ... }:

{
    imports =
        [ 
            ../parent-configuration.nix
            ./hardware-configuration.nix
        ]
        ++ lib.filesystem.listFilesRecursive ../../modules/nixos/essentials/.;

    hardware.cpu.intel.updateMicrocode = true;

    powerManagement.enable = true;
    systemd.sleep.extraConfig = ''
        HibernateDelaySec=30m
        SuspendState=mem
        '';

    boot.resumeDevice = "/dev/disk/by-uuid/80cdbd3a-5694-4f49-ac7b-b21b753a6429";

    networking.hostName = "portablemoustachemachine";

# List services that you want to enable:

    services = {
        upower.enable = true;
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

