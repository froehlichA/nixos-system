{ pkgs, mkFirefoxTheme, ... }:
mkFirefoxTheme {
    name = "simplerentfox";
    version = "20200919";
    src = pkgs.fetchFromGitHub {
        owner = "MiguelRAvila";
        repo = "SimplerentFox";
        rev = "31525c0e44efea9f169adfb648c3e017329ce1ee";
        sha256 = "1mh86rfz72zlwlh7lh3qq7by6vzw3k8dgshaq06my5fvrapvxnsj";
    };
    userChrome = "Linux/userChrome__WithURLBar.css";
    userContent = "Linux/userContent.css";
}