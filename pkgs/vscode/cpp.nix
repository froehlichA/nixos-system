{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "cpptools";
    publisher = "ms-vscode";
    version = "1.1.0";
    sha256 = "0b0wa45fv61l3zzwbdrqv8d2ij7nlfsid6xlgrc5pf3m9lcsl5ga";
}