{ pkgs, config, lib, inputs, ... }:

{
    programs = {
        zsh.enable = true;
        thunar.enable = true;
        tmux.enable = true;
        localsend.enable = true;
        obs-studio.enable = true;

        ssh.startAgent = true;

        nh = {
            enable = true;
            flake = "/home/nishant/Projects/nixos/";
        };

        mtr.enable = true;
        nix-ld = {
            enable = true;
        };

        sway = {
            enable = true;
            wrapperFeatures.gtk = true;
        };

        dconf.enable = true;
    };

# Required for ssh-agent
    services.gnome.gcr-ssh-agent.enable = false;
}
