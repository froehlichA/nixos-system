{ pkgs, ... }:
{
    powerlevel10k = import ./powerlevel10k.nix { inherit pkgs; };
}