{ pkgs, upkgs, ... }:
{
    require = [
        ../pkgs/theme/sddm/.options.nix
    ];

    # XSERVER
    services.xserver = {
        enable = true;
        desktopManager.xterm.enable = false;
        # SDDM
	    displayManager.defaultSession = "none+i3";
        displayManager.sddm.enable = true;
        displayManager.sddm.uTheme = upkgs.theme.sddm.abstract-dark {};
        displayManager.sessionCommands = ''
            systemctl --user import-environment QT_PLUGIN_PATH
        '';
        # I3
        windowManager.i3.enable = true;
        windowManager.i3.package = pkgs.i3-gaps;
    };
}