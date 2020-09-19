{ pkgs, mkFirefoxTheme, ... }:
mkFirefoxTheme {
    name = "slickfox";
    version = "20200919";
    src = pkgs.fetchFromGitHub {
        owner = "Etesam913";
        repo = "slick-fox";
        rev = "1eaf892f52b7b0bc6096b0387c6209b6c1731b29";
        sha256 = "0mcr47rzgbzlyrbwyp7yj0byyxvjbqr28zh7pxqy6d11dkx5q6sd";
    };
}