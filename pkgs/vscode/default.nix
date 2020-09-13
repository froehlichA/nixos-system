{ pkgs, ... }:
{
    direnv = pkgs.callPackage ./direnv.nix {};

    file-icons = pkgs.callPackage ./file-icons.nix {};

    gitgraph = pkgs.callPackage ./gitgraph.nix {};

    gitlens = pkgs.callPackage ./gitlens.nix {};

    nixfmt = pkgs.callPackage ./nixfmt.nix {};

    path-intellisense = pkgs.callPackage ./path-intellisense.nix {};

    pdf = pkgs.callPackage ./pdf.nix {};

    prettier = pkgs.callPackage ./prettier.nix {};
}