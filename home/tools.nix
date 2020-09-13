{ pkgs, upkgs, lib, config, ... }:
{
    require = [
        ../pkgs/neofetch/.options.nix
    ];

    # HOME MANAGER
    programs.home-manager.enable = true;

    # COMMAND LINE
    # urxvt
    programs.urxvt.enable = true;
    programs.urxvt.fonts = [ "xft:MesloLGS Nerd Font Mono:pixelsize=14" ];
    programs.urxvt.scroll.bar.enable = false;
    programs.urxvt.extraConfig = let colors = config.theme.colors; in colors // {
        foreground = colors.fg;
        background = colors.bg;
        internalBorder = 10;
        letterspace = -1;
    };
    # zsh
    programs.zsh.enable = true;
    programs.zsh.oh-my-zsh.enable = true;
    programs.zsh.plugins = with upkgs.zsh; [
        powerlevel10k
        {
            name = "powerlevel10k-config";
            src = lib.cleanSource ./.;
            file = "p10k.zsh";
        }
    ];
    programs.zsh.shellAliases.cat = "bat";
    # bat
    programs.bat.enable = true;
    programs.bat.config.theme = "base16";
    programs.bat.config.pager = "never";
    # git
    programs.git.enable = true;
    programs.git.lfs.enable = true;
    programs.git.userName = "froehlichA";
    programs.git.userEmail = "froehlich.alexander@protonmail.com";
    # nix dev
    services.lorri.enable = true;
    programs.direnv.enable = true;
    programs.direnv.enableZshIntegration = true;
    # neofetch
    programs.neofetch.enable = true;

    # GUI
    # firefox
    programs.firefox.enable = true;
    programs.firefox.profiles.default = {
        id = 0;
        name = "default";
        path = "tx4v24t0.default";
        isDefault = true;
    };
    # vscode
    programs.vscode.enable = true;
    programs.vscode.userSettings = {
        "window.titleBarStyle" = "custom";
        "keyboard.dispatch" = "keyCode";
        "workbench.iconTheme" = "file-icons";
        "git.enableSmartCommit" = true;
        "git.confirmSync" = false;
        "editor.fontFamily" = "'MesloLGS Nerd Font', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'";
        "terminal.external.linuxExec" = "urxvt";
    };
    programs.vscode.extensions = with upkgs.vscode; [
        pkgs.vscode-extensions.bbenoist.Nix
        file-icons
        gitgraph
        gitlens
        path-intellisense
        pdf
        prettier
        nixfmt
    ];

    # SERVICES
    services.gnome-keyring.enable = true;
    services.gnome-keyring.components = [ "secrets" ];


    home.packages = with pkgs; [
        # COMMAND LINE
        feh
        libnotify
        micro
        nixfmt
        scrot
        unzip
        xclip
        # GUI
        lxqt.pavucontrol-qt
        spotify
        steam
        xfce.thunar
    ];
}