{ mkSddmTheme, pkgs, ... }:
mkSddmTheme rec {
    name = "chili";
    version = "0.1.5";
    src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-chili";
        rev = version;
        sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
    };
    buildInputs = with pkgs; [ qt5.qtgraphicaleffects ];
}