{ lib, config, ... }:
{
    options = with lib; {
        theme = {
            uTheme = mkOption {
                description = "A colors upkgs theme.";
            };
            colors = let
                mkColor = desc: mkOption {
                    type = types.str;
                    description = desc;
                };
                mkNumColor = num: mkColor "Color #${num}.";
            in {
                bg = mkColor "The background color.";
                fg = mkColor "The foreground color.";
                primary = mkColor "The primary color.";
                secondary = mkColor "The secondary color.";
                color0 = mkNumColor 0;
                color1 = mkNumColor 1;
                color2 = mkNumColor 2;
                color3 = mkNumColor 3;
                color4 = mkNumColor 4;
                color5 = mkNumColor 5;
                color6 = mkNumColor 6;
                color7 = mkNumColor 7;
                color8 = mkNumColor 8;
                color9 = mkNumColor 9;
                color10 = mkNumColor 10;
                color11 = mkNumColor 11;
                color12 = mkNumColor 12;
                color13 = mkNumColor 13;
                color14 = mkNumColor 14;
                color15 = mkNumColor 15;
            };
        };
    };

    config = {
        theme.colors = config.theme.uTheme;
    };
}