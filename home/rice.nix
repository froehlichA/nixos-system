{ pkgs, upkgs, lib, config, ... }:
let
    polybarPackage = pkgs.polybar.override {
        i3GapsSupport = true;
        pulseSupport = true;
    };
in {
    require = [
        ../pkgs/theme/bg/.options.nix
        ../pkgs/theme/dunst/.options.nix
        ../pkgs/theme/polybar/.options.nix
        ../pkgs/theme/rofi/.options.nix
    ];

    # THEME
    theme = {
        uTheme = upkgs.colors.rasi (c: {
            primary = c.color2;
            secondary = c.color2;
        });
        background = ./background.jpg;
    };

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
        in lib.mkOptionDefault {
            "${mod}+d" = "exec --no-startup-id ${config.programs.rofi.scripts.apps}";
            "${mod}+Shift+e" = "exec --no-startup-id ${config.programs.rofi.scripts.power}";
            "${mod}+Shift+s" = "exec --no-startup-id ${pkgs.flameshot}/bin/flameshot gui";
        };
        config.startup = [
            {
                command = "${pkgs.writeScript "polybar.sh" ''
                    pkill polybar
                    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
                    ${polybarPackage}/bin/polybar main >>/tmp/polybar1.log 2>&1 &
                ''}";
                always = true;
                notification = false;
            }
        ];
        extraConfig = ''
            for_window [class=".*"] border pixel 0
        '';
    };

    # POLYBAR
    services.polybar = rec {
        enable = true;
        package = polybarPackage;
        script = ""; # let polybar be started by i3
        uTheme = upkgs.theme.polybar.one;
        hardware = upkgs.autohost.withHost {
            skipjack = {
                battery = "BAT0";
                adapter = "AC";
                interfaces.wired = "enp3s0f0";
                interfaces.wireless = "wlp1s0";
            };
            blowfish = {
                battery = "BAT0";
                adapter = "AC";
                interfaces.wired = "enp2s0";
                interfaces.wireless = "wlp4s0";
            };
        };
        scripts = {
            apps = pkgs.writeScript "app-menu" "${config.programs.rofi.scripts.apps}";
            power = pkgs.writeScript "power-menu" "${config.programs.rofi.scripts.power}";
        };
    };

    # ROFI
    programs.rofi.enable = true;
    programs.rofi.uTheme = upkgs.theme.rofi.one;

    # DUNST
    services.dunst.enable = true;
    services.dunst.iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
        size = "32x32";
    };
    services.dunst.uTheme = upkgs.theme.dunst.one;
}