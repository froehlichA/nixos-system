{ lib, config, ... }:
{
    options = with lib; {
        services.xserver.displayManager.sddm.uTheme = mkOption {
            type = types.attrs;
            description = "A sddm upkgs theme.";
        };
    };

    config = let uTheme = config.services.xserver.displayManager.sddm.uTheme;
    in {
        services.xserver.displayManager.sddm.theme = uTheme.name;
        environment.systemPackages = uTheme.packages;
    };
}