{ pkgs, ... }:
{
    home.packages = with pkgs; [
        slack # communication
        peek # screen recorder
        vlc # video player
    ];
}