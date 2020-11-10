{ pkgs, ... }:
{
    home.packages = with pkgs; [
        slack # communication
        teams # also communication
        flameshot # screenshot tool
        peek # screen recorder
        vlc # video player
        redis # player
    ];
}