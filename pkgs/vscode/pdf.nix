{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "pdf";
    publisher = "tomoki1207";
    version = "0.5.1";
    sha256 = "0bph7gnd6j55r997y62xb7n09cp08i46gmdk0lk5gjbpz3c03hvv";
}