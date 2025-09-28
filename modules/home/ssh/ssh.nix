{ pkgs, config, lib, ... }:

{
  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host github.com
        Hostname ssh.github.com
        User npmaharaj1 
        Port 443
        IdentityFile ~/.ssh/id_rsa-github
        IdentitiesOnly yes

      Host proxmox
        Hostname 10.1.1.196
        User root
        Port 22
        IdentityFile ~/.ssh/id_rsa-proxmox
        IdentitiesOnly yes

      Host alpine
        Hostname 10.1.1.140
        User root
        Port 22
        IdentityFile ~/.ssh/id_rsa-lightweight
        IdentitiesOnly yes
      
      Host debian
        Hostname 10.1.1.157
        User root
        Port 22
        IdentityFile ~/.ssh/id_rsa-debian
        IdentitiesOnly yes

      Host rpi
        Hostname 10.176.120.160
        User nishant
        Port 22
        IdentityFile ~/.ssh/id_rsa-rpi
        IdentitiesOnly yes

      Host uptime
        Hostname 10.1.1.172
        User nishant
        Port 22
        IdentityFile ~/.ssh/id_rsa-uptime
        IdentitiesOnly yes

    '';
  };
}
