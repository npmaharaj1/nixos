{ config, libs, pkgs, inputs, ... }:

{
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
	ids = [ "*" ];
	
	settings = {

	  main = {
	    rightshift = "rightshift";
	    capslock = "layer(capslock)";
	  };

	  "capslock:M" = {
	    h = "left";
	    j = "down";
	    k = "up";
	    l = "right";
	  };

	};
	extraConfig = ''

leftshift+rightshift = capslock

	'';
      };
    };
  };
}
