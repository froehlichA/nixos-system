{ pkgs, lib, config, ... }:
{
    options = with lib; {
        programs.neofetch.enable = mkOption {
            type = types.bool;
            description = "Enable neofetch.";
        };
    };

    config = lib.mkIf config.programs.neofetch.enable {
        home.packages = with pkgs; [
            neofetch
            w3m
            imagemagick7
        ];
    };
}