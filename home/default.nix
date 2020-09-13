{ pkgs, ... }:
{
    require = [
        ./basic.nix
        ./rice.nix
        ./tools.nix
    ];

    # Propagate upkgs to other modules
    _module.args.upkgs = pkgs.callPackage ../pkgs {};
}