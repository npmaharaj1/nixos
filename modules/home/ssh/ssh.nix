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
    '';
  };
}
