{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
    name = "git-graph";
    publisher = "mhutchie";
    version = "1.19.1";
    sha256 = "04hkyr5v4z62w88lhpqazypnkm48zz474p9cic5ix6k2rd6pj6y5";
}