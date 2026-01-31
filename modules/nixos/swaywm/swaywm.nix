{ pkgs, lib, config, ... }:

{
  options = {
    swaywmModule.enable = lib.mkEnableOption "enables swaywmModule";
  };

  config = lib.mkIf config.swaywmModule.enable {
        environment.systemPackages = with pkgs; [
            mako
        ];

        services.gnome.gnome-keyring.enable = true;

        programs.sway = {
            enable = true;
            wrapperFeatures.gtk = true;
        };

        security.polkit.enable = true;
  };
}
