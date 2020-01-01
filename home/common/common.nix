{ config, pkgs, lib, ... }:

with lib; 

{
    options.style = {
        colors = mkOption {
            type = types.attrs;
            description = "Colors used for styling.";
        };
    };

    config = {
        programs.home-manager.enable = true;
        nixpkgs.config.allowUnfree = true;

    };
}