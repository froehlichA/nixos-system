{ pkgs, colors, hardware, scripts, ... }:
{
    "bar/main" = {
        monitor = "\${env:MONITOR:}";
        width = "100%";
        height = 36;
        fixed-center = false;
        line-size = 2;
        background = colors.bg;
        foreground = colors.fg;
        border-top-size = 2;
        border-top-color = colors.primary;
        underline-size = 2;
        underline-color = 2;
        module-margin-left = 1;
        module-margin-right = 1;
        font-0 = "FantasqueSansMono Nerd Font:pixelsize=12;2";
        enable-ipc = true;
        scroll-up = "i3wm-wsnext";
        scroll-down = "i3wm-wsprev";
        modules-left = "menu workspaces";
        modules-right = "volume battery wired wireless date off";
    };

    "module/menu" = {
        type = "custom/text";
        content = " ";
        content-padding = 2;
        content-background = colors.primary;
        content-foreground = colors.fg;
        click-left = "${scripts.apps}";
    };

    "module/off" = {
        type = "custom/text";
        content = "";
        content-padding = 2;
        content-background = colors.primary;
        content-foreground = colors.fg;
        click-left = "${scripts.power}";
    };

    "module/workspaces" = {
        type = "internal/xworkspaces";
        pin-workspaces = false;
        enable-click = true;
        enable-scroll = true;
        format-padding = 0;

        icon-0 = "1;I";
        icon-1 = "2;II";
        icon-2 = "3;III";
        icon-3 = "4;IV";
        icon-4 = "5;V";
        icon-5 = "6;VI";
        icon-6 = "7;VII";
        icon-7 = "8;VIII";
        icon-8 = "9;IX";
        icon-9 = "10;X";
        format = "<label-state>";
        label-active = "%icon%";
        label-occupied = "%icon%";
        label-urgent = "%icon%";
        label-empty = "%icon%";

        label-occupied-padding = 2;
        label-empty-padding = 2;
        label-urgent-padding = 2;
        label-active-padding = 2;

        label-active-foreground = colors.primary;
        label-urgent-foreground = colors.color1;
        label-empty-foreground = colors.fg;
        label-occupied-foreground = colors.color3;

        label-active-underline = colors.primary;
        label-urgent-underline = colors.color1;
        label-occupied-underline = colors.color3;
    };

    "module/volume" = {
        type = "internal/pulseaudio";
        interval = 5;
        format-volume = "<ramp-volume> <label-volume>";
        label-volume = "%percentage%%";
        label-muted = "ﱝ --%";
        ramp-volume-0 = "奄";
        ramp-volume-1 = "奔";
        ramp-volume-2 = "墳";
    };

    "module/date" = {
        type = "internal/date";
        label = "%date% %time%";
        date = "";
        time = " %H:%M";
        date-alt = " %d.%m.%Y";
        time-alt = "";
    };

    "module/wired" = {
        type = "internal/network";
        interface = hardware.interfaces.wired;
        label-connected = " ETH";
        label-disconnected = "";
        label-disconnected-foreground = colors.color8;
    };

    "module/wireless" = if hardware.interfaces.wireless != null then {
        type = "internal/network";
        interface = hardware.interfaces.wireless;
        label-connected = "直 %essid%";
        label-disconnected = "睊";
        label-disconnected-background = colors.color8;
    } else null;

    "module/battery" = {
        type = "internal/battery";
        full-at = 98;
        battery = hardware.battery;
        adapter = hardware.adapter;
        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<ramp-capacity> <label-discharging>";
        format-full = "<label-full>";
        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = " 100%";
        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";
        ramp-capacity-5 = "";
        ramp-capacity-6 = "";
        ramp-capacity-7 = "";
        ramp-capacity-8 = "";
        ramp-capacity-9 = "";
    };
}