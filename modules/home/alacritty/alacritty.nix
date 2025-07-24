{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.7;
      };

      font = {
        size = 12.0;
        normal = {
          family = "JetBrainsMonoNL Nerd Font Mono";
          style = "Regular";
        };
      };

      # terminal.shell = {
      #   program = "/run/current-system/sw/bin/tmux";
      #   "args" = [
      #     "new-session"
      #     "-A"
      #     "-D"
      #     "-s"
      #     "zsh"
      #   ];
      # };
    };
  };
}
