{ config, pkgs, ... }:

{
    home.username = "milk";
    home.homeDirectory = "/home/milk";
    home.stateVersion = "25.05";

    imports = [
    	./modules/bash.nix
    ];

    home.packages = with pkgs; [
        zsh-autocomplete
        zsh-syntax-highlighting
        zsh-powerlevel10k
    	protonup-ng
        gh
    ];

    home.sessionVariables = {
    	STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    home.pointerCursor = {
    	enable = true;
    	gtk.enable = true;
    	package = pkgs.catppuccin-cursors.mochaSapphire;
    	name = "catppuccin-mocha-sapphire-cursors";
    	size = 12;
    };
    
    programs = {
        git = {
	        enable = true;
	        settings = {
	    	        user = {
		            name = "Andrew McDowell";
		            email = "andrewmcdowell2000@gmail.com";
		        };
		        
                init.defaultBranch = "main";
	        };
	    };
        go.enable = true;
        obs-studio.enable = true;
        obs-studio.plugins = [ pkgs.obs-studio-plugins.wlrobs ];
    };
}
