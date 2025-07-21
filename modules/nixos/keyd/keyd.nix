{ pkgs, config, lib, ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {

          main = {
            rightshift = "rightshift";
            capslock = "layer(meta)";
          };
        };
        extraConfig = ''

          leftshift+rightshift = capslock

          '';
      };
    };
  };

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
      MatchName=keyd virtual keyboard
      AttrKeyboardIntegration=internal
      '';
}
