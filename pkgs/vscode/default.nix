{ pkgs, ... }:
{
    aurelia = pkgs.callPackage ./aurelia.nix {};

    direnv = pkgs.callPackage ./direnv.nix {};

    es-lint = pkgs.callPackage ./es-lint.nix {};

    file-icons = pkgs.callPackage ./file-icons.nix {};

    gitgraph = pkgs.callPackage ./gitgraph.nix {};

    gitlens = pkgs.callPackage ./gitlens.nix {};

    markdown-it = pkgs.callPackage ./markdown-it.nix {};

    nixfmt = pkgs.callPackage ./nixfmt.nix {};

    path-intellisense = pkgs.callPackage ./path-intellisense.nix {};

    pdf = pkgs.callPackage ./pdf.nix {};

    prettier = pkgs.callPackage ./prettier.nix {};
}