{ config, lib, pkgs, ... }:

{
  options = {
    fuzzelModule.enable = lib.mkEnableOption "enables fuzzelModule";
  };

  config = lib.mkIf config.fuzzelModule.enable {
    programs.fuzzel = {
      enable = true;

      settings = {
        colors = {
          background = "1e1e2edd";
          text = "cdd6f4ff";
          prompt = "bac2deff";
          placeholder = "7f849cff";
          input = "cdd6f4ff";
          match = "f38ba8ff";
          selection = "585b70ff";
          selection-text = "cdd6f4ff";
          selection-match = "f38ba8ff";
          counter = "7f849cff";
          border = "74c7ecff";
        };
      };
    };
  };
}
