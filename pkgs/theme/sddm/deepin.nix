{ mkSddmTheme, pkgs, ... }:
mkSddmTheme {
    name = "deepin";
    version = "20180306";
    src = pkgs.fetchFromGitHub {
        owner = "Match-Yang";
        repo = "sddm-deepin";
        rev = "6d018d2cad737018bb1e673ef4464ccf6a2817e7";
        sha256 = "1ghkg6gxyik4c03y1c97s7mjvl0kyjz9bxxpwxmy0rbh1a6xwmck";
    };
    buildInputs = with pkgs; [ qt5.qtgraphicaleffects ];
}