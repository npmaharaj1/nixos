{ config, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "*".installation_mode = "blocked";

	# Dark Reader
	"addon@darkreader.org" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
	  installation_mode = "force_installed";
	  private_browsing = true;
	  default_area = "navbar";
	};

	# Ublock Origin
	"uBlock0@raymondhill.net" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	  installation_mode = "force_installed";
	  private_browsing = true;
	  default_area = "navbar";
	};

	# Bitwarden
	"{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
	  installation_mode = "force_installed";
	  default_area = "navbar";
	};

	# Brave Search
	"BraveSearchExtension@io.Uvera" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/brave-search/latest.xpi";
	  installation_mode = "force_installed";
	  private_browsing = true;
	  default_area = "menupanel";
	};
      };
      
      # Default Search Engine
      SearchEngines.Default = "Brave search";
    };
  };
}
