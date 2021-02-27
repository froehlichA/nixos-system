{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-tailwindcss";
    publisher = "bradlc";
    version = "0.5.9";
    sha256 = "0k93gfznfrcdfwr376ylfph5f5rrl8i862hpk6fnys98djzsgh4f";
}