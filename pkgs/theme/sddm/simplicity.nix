{ mkSddmTheme, pkgs, ... }:
mkSddmTheme {
    name = "simplicity";
    version = "20190730";
    src = pkgs.fetchFromGitLab {
        owner = "isseigx";
        repo = "simplicity-sddm-theme";
        rev = "d98fc1d03c44689883e27b57cc176b26d3316301";
        sha256 = "14wf62jgrpv4ybizbs57zma6kb4xy76qgl3wa38a5ykfgvpkcmrd";
    };
}