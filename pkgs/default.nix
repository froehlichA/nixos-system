{ pkgs, ... }:
{
    autohost = pkgs.callPackage ./autohost {};

    colors = pkgs.callPackage ./colors {};

    theme = pkgs.callPackage ./theme {};

    vscode = pkgs.callPackage ./vscode {};

    zsh = pkgs.callPackage ./zsh {};
}