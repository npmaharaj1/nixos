{ ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;

        shellAliases = {
            ls = "ls -a --color=auto";
            mkdir = "mkdir -p";
            wheel = " sudo usb_modeswitch -v 046d -p c26d -M 0f00010142 -C 0x03 -m 01 -r 01  ";
            dev-commit = "git add . && git commit -m 'automated commit' && git push origin master";
            rm = "trash";
        };

        sessionVariables = {
            NH_FLAKE = "/home/nishant/Projects/nixos/";
            XDG_CONFIG_HOME = "/home/nishant/.config/";
            SSH_AUTH_SOCK = "/home/nishant/.bitwarden-ssh-agent.sock";
            GTK2_RC_FILES = "";
            QT_QPA_PLATFORMTHEME = "qt6ct";
        };

        loginExtra = "if [[ $(tty) == '/dev/tty1' ]]; then sway; fi";

        envExtra = "wal -qi $(grep bg /home/nishant/.config/sway/config | awk -F' ' '{print $2}')";

        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
        };
    };
}
