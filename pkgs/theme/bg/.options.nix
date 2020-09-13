{ lib, config, ... }:
{
    options = with lib; {
        theme.background = mkOption {
            type = types.path;
            description = "The background picture.";
        };
    };

    config = {
        xsession.windowManager.i3.config.startup = [
            {
                command = "feh --bg-fill " + config.theme.background;
                always = true;
                notification = false;
            }
        ];
    };
}