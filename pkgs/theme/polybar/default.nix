{ pkgs, ... }:
let
    mkPolybarTheme = path: { colors, cfg }: import path {
        inherit pkgs colors;
        hardware = cfg.hardware;
        scripts = cfg.scripts;
    };
in {
    one = mkPolybarTheme ./one.nix;
}