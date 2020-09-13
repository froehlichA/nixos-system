{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "prettier-vscode";
    publisher = "esbenp";
    version = "3.13.0";
    sha256 = "1nbd8jz831q0i3h6kcw5l60gdvrngxjfbjxj8k3gx6fb5d6bvklb";
}