{ lib, config, ... }:
{
    imports = [
        ../../colors/.options.nix
    ];

    options = with lib; {
        services.polybar.uTheme = mkOption {
            description = "A polybar upkgs theme.";
        };
        services.polybar.hardware = {
            battery = mkOption {
                type = types.str;
                description = "The battery.";
            };
            adapter = mkOption {
                type = types.str;
                description = "The battery adapter.";
            };
            interfaces = {
                wired = mkOption {
                    type = types.str;
                    description = "The wired network interface.";
                };
                wireless = mkOption {
                    type = types.str;
                    description = "The wireless network interface.";
                };
            };
        };
        services.polybar.scripts = {
            apps = mkOption {
                type = types.path;
                description = "A script that activates an application launcher.";
            };
            power = mkOption {
                type = types.path;
                description = "A script that displays options for shutdown, restart, ...";
            };
        };
    };

    config = let
        colors = config.theme.colors;
        cfg = config.services.polybar;
        uTheme = cfg.uTheme;
    in {
        services.polybar.config = uTheme {
            inherit colors cfg;
        };
    };
}