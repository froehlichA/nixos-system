{ lib, config, ... }:
{
    imports = [
        ../../colors/.options.nix
    ];

    options = with lib; {
        programs.zathura.enableUTheme = mkEnableOption "Enable zathura upkgs theming.";
    };

    config = let
        colors = config.theme.colors;
        cfg = config.programs.zathura;
        uTheme = cfg.uTheme;
    in {
        programs.zathura.options = lib.mkIf cfg.enableUTheme {
            /* "recolor" = true;
            "notification-error-bg" = colors.color0;
            "notification-error-fg" = colors.bg;
            "notification-warning-bg" = colors.color0;
            "notification-warning-fg" = colors.fg;
            "notification-bg" = colors.bg;
            "notification-fg" = colors.fg;
            "completion-group-bg" = colors.bg;
            "completion-group-fg" = colors.fg;
            "completion-bg" = colors.color0;
            "completion-fg" = colors.fg;
            "completion-hightlight-bg" = colors.color0;
            "completion-hightlight-bg" = colors.fg; */
            "recolor" = true;
            "recolor-lightcolor" = colors.bg;
            "recolor-darkcolor" = colors.fg;
            "default-bg" = colors.bg;
            "default-fg" = colors.fg;
        };
    };
}