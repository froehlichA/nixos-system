{ pkgs, ... }:
{
    home.packages = with pkgs; [
        slack # communication
        flameshot # screenshot tool
        peek # screen recorder
        vlc # video player
        redis # player
    ];
}