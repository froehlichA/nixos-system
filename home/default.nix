{ pkgs, ... }:
let upkgs = pkgs.callPackage ../pkgs {}; in {
    require = [
        ./basic.nix
        ./rice.nix
        ./services.nix
        ./tools.nix
        ./work.nix
        ../pkgs/colors/.options.nix
    ];

    # THEME
    theme = {
        uTheme = upkgs.colors.rasi (c: {
            primary = c.color2;
            secondary = c.color2;
        });
        background = ./assets/background.jpg;
    };

    # Propagate upkgs to other modules
    _module.args.upkgs = upkgs;
}