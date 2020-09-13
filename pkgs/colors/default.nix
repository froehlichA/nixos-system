{ pkgs, lib, ... }:
let
    colorFromJSON = with builtins; json: {
        bg = json.background;
        fg = json.foreground;
        color0 = elemAt json.color 0;
        color1 = elemAt json.color 1;
        color2 = elemAt json.color 2;
        color3 = elemAt json.color 3;
        color4 = elemAt json.color 4;
        color5 = elemAt json.color 5;
        color6 = elemAt json.color 6;
        color7 = elemAt json.color 7;
        color8 = elemAt json.color 8;
        color9 = elemAt json.color 9;
        color10 = elemAt json.color 10;
        color11 = elemAt json.color 11;
        color12 = elemAt json.color 12;
        color13 = elemAt json.color 13;
        color14 = elemAt json.color 14;
        color15 = elemAt json.color 15;
    };

    themeFromColors = colors: f:
    let
        res = f colors;
    in colors // {
        primary = res.primary;
        secondary = res.secondary;
    };

    readJSON = path: builtins.fromJSON (builtins.readFile path);
    mkColorTheme = path: f: themeFromColors (colorFromJSON (readJSON path)) f;
in {
    rasi = mkColorTheme ./rasi.json;
}