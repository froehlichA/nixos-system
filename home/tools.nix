{ pkgs, upkgs, lib, config, ... }:
{
    require = [
        ../pkgs/neofetch/.options.nix
        ../pkgs/theme/zathura/.options.nix
    ];

    # HOME MANAGER
    programs.home-manager.enable = true;
    home.sessionVariables = let
        gsettings = pkgs.gsettings-desktop-schemas;
        common = {
            XDG_DATA_DIRS = "${gsettings}/share/gsettings-schemas/${gsettings.name}:" + 
            "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS";
        };
    in upkgs.autohost.withHost {
        blowfish = common // {
            # Locale is weird on Non-NixOS device
            LOCALE_ARCHIVE = "/usr/lib/locale/locale-archive";
            # askpass isn't set either
            SSH_ASKPASS = "${pkgs.ksshaskpass}/bin/ksshaskpass";
            # Android Dev
            ANDROID_SDK_ROOT = "/opt/android-sdk";
            JAVA_HOME = "/usr/lib/jvm/java-8-openjdk";
        };
        skipjack = common // {};
    };

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
    programs.git.ignores = [ ".envrc" "shell.nix" ];
    # ssh
    programs.ssh.enable = true;
    # nix dev
    services.lorri.enable = true;
    programs.direnv.enable = true;
    programs.direnv.enableZshIntegration = true;
    # neofetch
    programs.neofetch.enable = true;
    programs.taskwarrior.enable = true;
    programs.taskwarrior.config.taskd = {
        certificate = "~/.nixos/tw/private.certificate.pem";
        key = "~/.nixos/tw/private.key.pem";
        ca = "~/.nixos/tw/ca.cert.pem";
        server = "taskwarrior.inthe.am:53589";
        credentials = "inthe_am/froehlich.alexander.at/a3056706-7b92-4a89-bcb5-580e9ee5c2ab";
        trust = "ignore hostname";
    };

    # GUI
    # firefox
    programs.chromium.enable = true;
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
        "diffEditor.renderSideBySide" = false;
    };
    programs.vscode.extensions = with upkgs.vscode; [
        pkgs.vscode-extensions.bbenoist.Nix
        aurelia
        direnv
        es-lint
        file-icons
        gitgraph
        gitlens
        markdown-it
        nixfmt
        path-intellisense
        pdf
        prettier
    ];
    # pdf viewer
    programs.zathura.enable = true;
    programs.zathura.enableUTheme = true;

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
        python38Packages.howdoi # stackoverflow helper
        # GUI
        libreoffice # libreoffice
        lxqt.pavucontrol-qt # sound control
        discord # voice & text chat
        (callPackage ./tmp/mongodb-compass.nix {}) # mongodb gui
        multimc # minecraft
        spotify # music
        steam # gaming
        xfce.thunar # filebrowser
        (obsidian.overrideDerivation (o: {
            obsidian = pkgs.makeDesktopItem {
                name = "Obsidian";
                exec = "obsidian";
                comment = "Knowledge Base Management";
                desktopName = "Obsidian";
                genericName = "Knowledge Management";
                categories = "Office";
            };
        })) # Knowledge Base
        virtualbox # Virtualisation
    ];
}