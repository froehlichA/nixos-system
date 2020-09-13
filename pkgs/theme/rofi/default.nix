{ pkgs, ... }:
let
    mkRofiScript = pkgs.writeScript;
    mkRofiTheme = path: { colors }: (import path {
        inherit pkgs colors mkRofiScript;
    });
in {
    one = mkRofiTheme ./one.nix;
}