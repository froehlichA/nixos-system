{ lib, config, ... }:
{
    imports = [
        ../../colors/.options.nix
    ];

    options = with lib; {
        services.dunst.uTheme = mkOption {
            description = "A dunst upkgs theme.";
        };
    };

    config = let
        colors = config.theme.colors;
        cfg = config.services.dunst;
        uTheme = cfg.uTheme;
    in {
        services.dunst.settings = uTheme {
            inherit colors;
        };
    };
}