{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "nim";
    publisher = "kosz78";
    version = "0.6.6";
    sha256 = "1s1npk6fzjngy6bjr65qgabsh6drkwmp2fmbpl3ryypjywpbmmdh";
}