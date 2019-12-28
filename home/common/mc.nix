# COMMON HOME CONFIGURATION (User "MC")

{ config, pkgs, lib, ... }:

with lib; 

let
    cfg = config.style;
    colors = cfg.colors;
in {
	options.style = {
        colors = mkOption {
            type = types.attrs;
            description = "Colors used for styling.";
        };
    };

	config = {
		programs.home-manager.enable = true;
		nixpkgs.config.allowUnfree = true;

		# OPENBOX
		xsession.enable = true;
		xsession.windowManager.command = "${pkgs.openbox}/bin/openbox-session";

		# TINT2
		xsession.initExtra = "tint2 &";

		# GTK & QT
        gtk.enable = true;
		home.file.".themes/Lumiere/gtk-2.0" = {
			source = ./theme/gtk/Lumiere/gtk-2.0;
			recursive = true;
		};
		home.file.".themes/Lumiere/gtk-3.0" = {
			source = ./theme/gtk/Lumiere/gtk-3.0;
			recursive = true;		
		};
        gtk.theme.name = "Lumiere";
        gtk.iconTheme.package = pkgs.papirus-icon-theme;
        gtk.iconTheme.name = "Papirus";
        qt.enable = true;
        qt.platformTheme = "gtk";

		# URXVT
		programs.urxvt.enable = true;
		programs.urxvt.package = pkgs.rxvt_unicode_with-plugins;
		programs.urxvt.fonts = [ "xft:FantasqueSansMono Nerd Font:size=10" ];
		programs.urxvt.scroll.bar.enable = false;
		programs.urxvt.extraConfig = colors // { internalBorder = 10; };
		programs.urxvt.keybindings = {
			"Control-c" = "eval:selection_to_clipboard";
			"Control-v"	= "eval:paste_clipboard";
		};

		# ZSH
		programs.zsh.enable = true;
		programs.zsh.oh-my-zsh.enable = true;
		programs.zsh.oh-my-zsh.theme = "cloud";

		# PROGRAMS
		home.packages = with pkgs; [
			xfce.thunar
			openbox
			tint2
			libreoffice
			multimc
		];
	};
}