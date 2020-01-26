# BLOWFISH HOME CONFIGURATION (User "MC")

{ stdenv, config, pkgs, ... }:

{
    imports = [
        ../common/colors/blowfish.nix
        ../common/mc.nix
        ../common/conf/openbox/default-rc.nix
        ../common/conf/openbox/mc-menu.nix
        ../common/theme/bg/neon.nix
        ../common/theme/openbox/raven.nix
        ../common/theme/tint2/flatstudio-variant.nix
    ];   
}