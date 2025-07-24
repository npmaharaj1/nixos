{ config, pkgs, ... }:

{
  programs.hyprpanel = {
    # enable = true;

    settings = {
      theme = {
        bar = {
          scaling = 60;
        };
      };
    };
  };
}
