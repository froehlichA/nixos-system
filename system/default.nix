{ pkgs, ... }:
{
    require = [
        /etc/nixos/hardware-configuration.nix
        ./apps.nix
        ./basic.nix
        ./hardware.nix
        ./language.nix
        ./networking.nix
        ./services.nix
        ./users.nix
        ./xserver.nix
    ];

    # Propagate upkgs to other modules
    _module.args.upkgs = pkgs.callPackage ../pkgs {};

    # VERSION
    system.stateVersion = "19.03";
}