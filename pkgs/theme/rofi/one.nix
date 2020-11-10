{ pkgs, colors, mkRofiScript, ... }:
let commonConfig = ''
    -hide-scrollbar true \
    -bw 3 -line-padding 10 -padding 20 -yoffset 49 \
    -font "FantasqueSansMono Nerd Font 12" \
    -color-enabled true \
    -color-window "${colors.bg},${colors.color0},${colors.color0}" \
    -color-normal "${colors.color0},${colors.fg},${colors.color0},${colors.primary},${colors.fg}" \
    -color-active "${colors.secondary},${colors.fg},${colors.color0},${colors.primary},${colors.fg}" \
    -color-urgent "${colors.color1},${colors.fg},${colors.color0},${colors.primary},${colors.fg}" \'';
in {
    apps = mkRofiScript "app-menu" ''
        ${pkgs.rofi}/bin/rofi -show drun \
        -width 30 -xoffset 10 \
        ${commonConfig}
        -display-drun "Applications :" -drun-display-format "{name}" \
        -location 1 -lines 10 -columns 2 \
        -show-icons
    '';

    power = mkRofiScript "power-menu" ''
        MENU="$(${pkgs.rofi}/bin/rofi -dmenu \
        -width 15 -xoffset "-10" \
        ${commonConfig}
        -sep "|" -i -p 'System :' \
        -location 3 -lines 4 -columns 1 \
        <<< " Lock|﫼 Logout|累 Reboot|襤 Shutdown")"
        case "$MENU" in
            *Lock) ${pkgs.i3lock-fancy}/bin/i3lock-fancy -p ;;
            *Logout) ${pkgs.i3}/bin/i3-msg exit ;;
            *Reboot) systemctl reboot ;;
            *Shutdown) systemctl -i poweroff
        esac
    '';

    window = mkRofiScript "window-menu" ''
        ${pkgs.rofi}/bin/rofi -show window \
        -width 30 \
        ${commonConfig}
        -i -p 'Window: '
    '';
}