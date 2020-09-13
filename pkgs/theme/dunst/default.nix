{ pkgs, ... }:
let
    mkDunstTheme = path: { colors }: import path {
        inherit pkgs colors;
    };
in {
    one = mkDunstTheme ./one.nix;
}