{ pkgs, mkFirefoxTheme, ... }:
mkFirefoxTheme {
    name = "simplefox";
    version = "20200919";
    src = pkgs.fetchFromGitHub {
        owner = "evanswa0606";
        repo = "firefox-simpletheme";
        rev = "c16a63ab20e8e5a15d93f386af292e5ee4d2f50e";
        sha256 = "06lk1s8x3pgmnkr0pj3z4sgazr2rqrjy96ygnyjmch3qz86rn6hv";
    };
    userChrome = "userChrome-nobuttonbox.css";
}