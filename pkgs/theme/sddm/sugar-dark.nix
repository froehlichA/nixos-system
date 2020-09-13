{ mkSddmTheme, pkgs, ... }:
mkSddmTheme rec {
    name = "sugar-dark";
    version = "1.2";
    src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "v${version}";
        sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
    };
    buildInputs = with pkgs; [ qt5.qtgraphicaleffects ];
}