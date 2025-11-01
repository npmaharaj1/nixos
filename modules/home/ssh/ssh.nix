{ pkgs, config, lib, ... }:

{

    programs.ssh = {
        enable = true;

        extraConfig = ''
            Host github.com
                Hostname ssh.github.com
                User npmaharaj1
                Port 443
            
            Host proxmox
                Hostname 10.1.1.196
                User root
                Port 22
            
            Host pbs
                Hostname 10.1.1.126
                User root
                Port 22

            Host rpi
                Hostname 10.1.1.172
                User root
                Port 22

            Host pve
                Hostname 10.1.1.196
                User root
                Port 22

            Host omv
                Hostname 10.1.1.160
                User root
                Port 22

            Host haos
                Hostname 10.1.1.89
                User root
                Port 22


        '';
    };
}
