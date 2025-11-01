{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;

        shellAliases = {
            ls = "ls -a --color=auto";
            lsl = "tree";
            mkdir = "mkdir -p";
            wheel = " sudo usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01  ";
            dev-commit = "git add . && git commit -m 'automated commit' && git push origin master";
            nurse = "nh os switch && ~/Projects/nixos/modules/home/templates/start.sh";
            rm = "trash";

            gcupload = "hyprctl dispatch exec '[workspace 2] thunar .' && echo 'done'";

            invidious = "pipe-viewer --invidious! --api=s https://invidious.npmaharaj1.duckdns.org";
        };

        sessionVariables = {
            NH_FLAKE = "/home/nishant/Projects/nixos/";
            XDG_CONFIG_HOME = "/home/nishant/.config/";
            SSH_AUTH_SOCK = "/home/nishant/.bitwarden-ssh-agent.sock";
            GTK2_RC_FILES = "";
        };

        envExtra = "wal -i $(cat /home/nishant/.cache/swww/*) -q";

        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
        };
    };
}
