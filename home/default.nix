{ pkgs, ... }:
{
    require = [
        ./basic.nix
        ./rice.nix
        ./services.nix
        ./tools.nix
        ./work.nix
    ];

    # Propagate upkgs to other modules
    _module.args.upkgs = pkgs.callPackage ../pkgs {};
}