{ pkgs, ... }:
{
    services.acpid.handlers = {
        brightness-up = {
            action = "/run/current-system/sw/bin/light -A 30";
            event = "video/brightnessup.*";
        };
        brightness-down = {
            action = "/run/current-system/sw/bin/light -U 30";
            event = "video/brightnessdown.*";
        };
        volume-up = {
            action = "/run/current-system/sw/bin/runuser -l alex -c 'amixer -q set Master 5%+ unmute'";
            event = "button/volumeup.*";
        };
        volume-down = {
            action = "/run/current-system/sw/bin/runuser -l alex -c 'amixer -q set Master 5%- unmute'";
            event = "button/volumedown.*";
        };
        volume-mute = {
            action = "/run/current-system/sw/bin/runuser -l alex -c 'amixer -q set Master toggle'";
            event = "button/mute.*";
        };
    };
}