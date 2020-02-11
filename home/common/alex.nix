# COMMON HOME CONFIGURATION (User "Alex")

{ config, pkgs, lib, ... }:

with lib;

let
    cfg = config.style;
    colors = cfg.colors;
in {
    imports = [
        # COMMON
        ./common.nix
    ];

    config = {

        # I3
        xsession.enable = true;
        xsession.windowManager.i3 = {
            enable = true;
            package = pkgs.i3-gaps;
            config.bars = [];
            config.gaps.inner = 15;
            config.gaps.outer = 5;
            config.keybindings = let
                mod = config.xsession.windowManager.i3.config.modifier;
            in mkOptionDefault {
                "${mod}+d" = "exec rofi -show drun";	
            };
            config.startup = [
                {
                    command = "./.config/nixout/polybar/polybar.sh";
                    always = true;
                    notification = false;
                }
                {
                    command = "xsetroot -solid \"${colors.color0}\"";
                    always = true;
                    notification = false;
                }
            ];
            extraConfig = ''
                for_window [class=".*"] border pixel 0
            '';
        };
        home.file.".config/nixout/polybar/polybar.sh".source = builtins.toFile "polybar.sh" "
            #!/usr/bin/env bash
            pkill polybar
            while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
            polybar top >>/tmp/polybar1.log 2>&1 &
        ";
        home.file.".config/nixout/polybar/polybar.sh".executable = true;
        
        # ROFI
        programs.rofi.enable = true;

        # URXVT
        programs.urxvt.enable = true;
        programs.urxvt.package = pkgs.rxvt_unicode_with-plugins;
        programs.urxvt.fonts = [ "xft:FantasqueSansMono Nerd Font:size=10" ];
        programs.urxvt.scroll.bar.enable = false;
        programs.urxvt.extraConfig = colors // { internalBorder = 10; };

        # ZSH
        programs.zsh.enable = true;
        programs.zsh.oh-my-zsh.enable = true;
        programs.zsh.oh-my-zsh.theme = "norm";
        programs.zsh.shellAliases.cat = "bat";

        # GTK & QT
        gtk.enable = true;
        gtk.theme.package = pkgs.arc-theme;
        gtk.theme.name = "Arc-Dark";
        gtk.iconTheme.package = pkgs.paper-icon-theme;
        gtk.iconTheme.name = "Paper";
        qt.enable = true;
        qt.platformTheme = "gtk";

        # POLYBAR
        services.polybar.enable = true;
        services.polybar.package = pkgs.polybar.override { i3GapsSupport = true; };
        services.polybar.script = ""; # let polybar be started by i3

        # PROGRAMS
        # bat
        programs.bat.enable = true;
        programs.bat.config.theme = "base16";
        programs.bat.config.pager = "never";
        # git
        programs.git.enable = true;
        programs.git.lfs.enable = true;
        programs.git.userName = "froehlichA";
        programs.git.userEmail = "froehlich.alexander@protonmail.com";
        # vscode
        programs.vscode.enable = true;
        programs.vscode.package = pkgs.vscodium;
        programs.vscode.userSettings = {
            "window.titleBarStyle" = "custom";
            "keyboard.dispatch" = "keyCode";
            "workbench.iconTheme" = "file-icons";
            "git.enableSmartCommit" = true;
            "git.confirmSync" = false;
        };
        home.packages = with pkgs; [
            # steam
            steam
            # scrot
            scrot
        ]; 
        # taskwarrior
        home.file.".task" = {
            source = ./conf/taskwarrior;
            recursive = true;
        };
        programs.taskwarrior.enable = true;
        programs.taskwarrior.config.taskd.ca = "~/.task/ca.cert";
        programs.taskwarrior.config.taskd.certificate = "~/.task/home/alex/public.cert";
        programs.taskwarrior.config.taskd.key = "~/.task/home/alex/private.key";
        programs.taskwarrior.config.taskd.credentials = "home/alex/58d7565e-10ab-4ead-b92e-cc8fefb6ae63";
        programs.taskwarrior.config.taskd.server = "atbash.froehlich.network:53589";
        programs.taskwarrior.config.taskd.trust = "ignore hostname";
    };
}