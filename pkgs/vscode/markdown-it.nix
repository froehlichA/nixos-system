{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "markdown-pdf";
    publisher = "yzane";
    version = "1.4.4";
    sha256 = "00cjwjwzsv3wx2qy0faqxryirr2hp60yhkrlzsk0avmvb0bm9paf";
}