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

      Host alpine-docker
        Hostname 10.1.1.140
        User root
        Port 22
        IdentityFile ~/.ssh/id_rsa-lightweight
        IdentitiesOnly yes
    '';
  };
}
