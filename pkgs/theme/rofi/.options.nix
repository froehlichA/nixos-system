{ lib, config, ... }:
{
    imports = [
        ../../colors/.options.nix
    ];

    options = with lib; {
        programs.rofi.uTheme = mkOption {
            description = "A rofi upkgs theme.";
        };
        programs.rofi.scripts = mkOption {
            type = types.attrs;
            description = "Rofi scripts.";
        };
    };

    config = let
        colors = config.theme.colors;
        cfg = config.programs.rofi;
        uTheme = cfg.uTheme;
    in {
        programs.rofi.scripts = uTheme {
            inherit colors;
        };
    };
}