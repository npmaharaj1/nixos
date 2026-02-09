{ pkgs, lib, config, inputs, ... }:

{
    system.autoUpgrade = {
        enable = true;
        allowReboot = false;
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
}
