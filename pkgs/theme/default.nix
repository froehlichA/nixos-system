{ pkgs, ... }:
{
    dunst = pkgs.callPackage ./dunst {};

    polybar = pkgs.callPackage ./polybar {};

    rofi = pkgs.callPackage ./rofi {};

    sddm = pkgs.callPackage ./sddm {};
}