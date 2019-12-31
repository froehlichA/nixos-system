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
    };
}