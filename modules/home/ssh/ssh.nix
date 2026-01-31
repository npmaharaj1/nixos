{ pkgs, config, lib, ... }:

{

    programs.ssh = {
        enable = true;

        enableDefaultConfig = false;

        matchBlocks."*" = {
            forwardAgent = true;
            serverAliveInterval = 0;
            serverAliveCountMax = 3;
            compression = false;
            addKeysToAgent = "no";
            hashKnownHosts = false;
            userKnownHostsFile = "~/.ssh/known_hosts";
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
        };

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

            Host kodi
                Hostname 10.1.1.81
                User kodi
                Port 22


            '';
    };
}
