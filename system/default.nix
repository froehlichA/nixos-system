{ pkgs, ... }:
let upkgs = pkgs.callPackage ../pkgs {}; in {
    require = [
        /etc/nixos/hardware-configuration.nix
        ./apps.nix
        ./basic.nix
        ./hardware.nix
        ./language.nix
        ./networking.nix
        ./services.nix
        ./users.nix
        ./work.nix
        ./xserver.nix
        ../pkgs/colors/.options.nix
    ];

    # THEME
    theme = {
        uTheme = upkgs.colors.rasi (c: {
            primary = c.color2;
            secondary = c.color2;
        });
    };

    # Propagate upkgs to other modules
    _module.args.upkgs = upkgs;

    # VERSION
    system.stateVersion = "19.03";
}