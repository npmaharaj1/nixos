{ pkgs, lib, config, ... }:

{
  options = {
    recorderModule.enable = lib.mkEnableOption "enables recorderModule";
  };

  config = lib.mkIf config.recorderModule.enable {
    programs = {
        gpu-screen-recorder.enable = true;
    };
  };
}
