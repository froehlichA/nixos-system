{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "atlascode";
    publisher = "atlassian";
    version = "2.8.3";
    sha256 = "11s9dmg2israj296jfacq1s1v2pa0z7pv9q5avl0i042jrm8palh";
}