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
            src = lib.cleanSource ./assets;
            file = "p10k.zsh";
        }
    ];
    programs.zsh.shellAliases.cat = "bat";
    programs.zsh.shellAliases.man = "tldr";
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
    programs.firefox.profiles.default = 
    let theme = upkgs.theme.firefox.simplefox;
    in {
        id = 0;
        name = "default";
        path = "tx4v24t0.default";
        isDefault = true;
        userChrome = theme.userChrome;
        userContent = theme.userContent;
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
        "github.gitAuthentication" = false;
        "markdown-pdf.executablePath" = "${pkgs.chromium}/bin/chromium";
    };
    programs.vscode.extensions = with upkgs.vscode; [
        pkgs.vscode-extensions.bbenoist.Nix
        direnv
        file-icons
        gitgraph
        gitlens
        markdown-it
        nixfmt
        path-intellisense
        pdf
        prettier
    ];

    home.packages = with pkgs; [
        # COMMAND LINE
        feh # image display
        libnotify # dunst
        micro # editor
        nixfmt # code formatting
        scrot # screenshot
        steam-run # nix dev tool
        unzip # untar helper
        xclip # clipboard manager
        tldr # man pages
        # GUI
        lxqt.pavucontrol-qt # sound control
        (callPackage ./tmp/mongodb-compass.nix {}) # mongodb gui
        spotify # music
        steam # gaming
        xfce.thunar # filebrowser
    ];
}