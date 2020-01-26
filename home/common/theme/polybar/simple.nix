{ config, ... }:

let
    colors = config.style.colors;
in {
    services.polybar.config = let
        fgColor = col: str: "%{F${col}}${str}%{F-}";
        fgColor1 = fgColor colors.color1;
        fgColor4 = fgColor colors.color4;
        colorGray = "#6f6f6f";
        fgColorGray = fgColor colorGray;
    in {
    
        "bar/top" = {
            height = "3%";
            padding = 5;
            module-margin-left = 2;
            module-margin-right = 2;
            background = colors.background;
            foreground = colors.foreground;
            font-0 = "FantasqueSansMono Nerd Font;0";
            modules-left = "i3";
            modules-right = "cpu memory wired wireless battery date";
            tray-position = "right";
            tray-maxsize = 16;
            tray-padding = 4;
        };

        "module/battery" = {
            type = "internal/battery";
            full-at = 98;
            format-charging = "<animation-charging> <label-charging>";
            format-discharging = "<ramp-capacity> <label-discharging>";
            format-full = "${fgColor4 ""} <label-full>";
            animation-charging-0 = "";
            animation-charging-1 = "";
            animation-charging-2 = "";
            animation-charging-3 = "";
            animation-charging-4 = "";
            animation-charging-foreground = colors.color4;
            ramp-capacity-0 = "";
            ramp-capacity-1 = "";
            ramp-capacity-2 = "";
            ramp-capacity-3 = "";
            ramp-capacity-4 = "";
            ramp-capacity-foreground = colors.color1;
        };

        "module/cpu" = {
            type = "internal/cpu";
            format = "<ramp-load> <label>";
            label = "%percentage%%";
            ramp-load-0 = "";
            ramp-load-0-foreground = colors.color4;
            ramp-load-1 = "";
            ramp-load-1-foreground = colors.color1;
        };

        "module/date" = {
            type = "internal/date";
            internal = 5;
            date = "%Y-%m-%d";
            time = "%H:%M";
            label = "${fgColor4 "%date%"} %time%";
        };

        "module/i3" = {
            type = "internal/i3";
            ws-icon-0 = "1;I";
            ws-icon-1 = "2;II";
            ws-icon-2 = "3;III";
            ws-icon-3 = "4;IV";
            ws-icon-4 = "5;V";
            ws-icon-5 = "6;VI";
            ws-icon-6 = "7;VII";
            ws-icon-7 = "8;VIII";
            ws-icon-8 = "9;IX";
            ws-icon-9 = "10;X";
            format = "<label-state> <label-mode>";
            label-mode = "%mode%";
            label-mode-padding = 0;
            label-focused = "%icon%";
            label-focused-padding = 1;
            label-unfocused = "%icon%";
            label-unfocused-padding = 1;
            label-unfocused-foreground = colorGray;
            label-visible = "%icon%";
            label-visible-padding = 1;
            label-urgent = "%icon%";
            label-urgent-padding = 1;
            label-urgent-foreground = colors.color1;
        };

        "module/memory" = {
            type = "internal/memory";
            format = "<ramp-used> <label>";
            label = "%percentage_used%%";
            ramp-used-0 = "﬘";
            ramp-used-0-foreground = colors.color4;
            ramp-used-1 = "﬘";
            ramp-used-1-foreground = colors.color1;
        };

        "module/wired" = {
            type = "internal/network";
            format-connected = "<label-connected>";
            label-connected = "${fgColor4 "E"} %essid%";
        };

        "module/wireless" = {
            type = "internal/network";
            format-connected = "<ramp-signal> <label-connected>";
            label-connected = "%essid%";
            ramp-signal-0 = "直";
            ramp-signal-0-foreground = colors.color1;
            ramp-signal-1 = "直";
            ramp-signal-2 = "直";
            ramp-signal-3 = "直";
            ramp-signal-foreground = colors.color4;
        };
    };
}