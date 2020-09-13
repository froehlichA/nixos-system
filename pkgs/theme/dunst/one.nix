{ colors, ... }:
{
    global = {
        geometry = "400x5-10+48";
        follow = "mouse";
        padding = 16;
        horizontal_padding = 16;
        frame_width = 2;
        frame_color = colors.color0;
        seperator_color = colors.color0;
        font = "FantasqueSansMono Nerd Font";
        markup = true;
        format = "<b>%s</b> %p\\n%b";
        vertical_alignment = "top";
        word_wrap = true;
        icon_position = "left";
        mouse_middle_click = "close_all";
        mouse_right_click = "do_action";
        min_icon_size = 32;
        max_icon_size = 32;
        dmenu = "rofi -dmenu";
    };

    urgency_low = {
        background = colors.color6;
        foreground = colors.fg;
        timeout = 10;
    };

    urgency_normal = {
        background = colors.color4;
        foreground = colors.fg;
        timeout = 10;
    };

    urgency_critical = {
        background = colors.color1;
        foreground = colors.fg;
        timeout = 0;
    };
}