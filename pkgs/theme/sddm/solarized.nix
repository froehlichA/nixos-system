{ mkSddmTheme, pkgs, ... }:
mkSddmTheme {
    name = "solarized";
    version = "20190103";
    src = pkgs.fetchFromGitHub {
        owner = "MalditoBarbudo";
        repo = "solarized_sddm_theme";
        rev = "2b5bdf1045f2a5c8b880b482840be8983ca06191";
        sha256 = "1n36i4mr5vqfsv7n3jrvsxcxxxbx73yq0dbhmd2qznncjfd5hlxr";
    };
    buildInputs = with pkgs; [ qt5.qtgraphicaleffects ];
}