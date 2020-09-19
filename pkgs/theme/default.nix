{ pkgs, ... }:
{
    dunst = pkgs.callPackage ./dunst {};

    firefox = pkgs.callPackage ./firefox {};

    polybar = pkgs.callPackage ./polybar {};

    rofi = pkgs.callPackage ./rofi {};

    sddm = pkgs.callPackage ./sddm {};
}