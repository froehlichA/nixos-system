{ mkSddmTheme, pkgs, ... }:
mkSddmTheme {
    name = "aerial";
    version = "20191018";
    src = pkgs.fetchFromGitHub {
        owner = "3ximus";
        repo = "aerial-sddm-theme";
        rev = "1a8a5ba00aa4a98fcdc99c9c1547d73a2a64c1bf";
        sha256 = "0f62fqsr73d6fjpfhsdijin9pab0yn0phdyfqasybk50rn59861y";
    };
    buildInputs = with pkgs; [ qt5.qtmultimedia qt5.qtgraphicaleffects ];
}