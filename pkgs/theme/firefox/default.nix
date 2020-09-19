{ pkgs, stdenv, ... }:
let
    mkFirefoxThemeDrv = { name, version, src, buildInputs ? [],
        userChrome ? "userChrome.css", userContent ? "userContent.css" 
    }:
        let 
            theme = stdenv.mkDerivation rec {
                pname = "firefox-theme-${name}";
                inherit version src buildInputs;

                buildCommand = ''
                    dir=$out/share/firefox/themes/${name}

                    mkdir -p $dir
                    cp -r $src/* $dir/
                '';
            };
            outPath = theme.outPath + "/share/firefox/themes/${name}/";
            userChromePath = outPath + userChrome;
            userContentPath = outPath + userContent;
            readFile = path: if builtins.pathExists path then builtins.readFile path else "";
        in {
            inherit name;
            userChrome = readFile userChromePath;
            userContent = readFile userContentPath;
        };

    mkFirefoxTheme = path: pkgs.callPackage path {
        mkFirefoxTheme = mkFirefoxThemeDrv;
    };
in {

    simplefox = mkFirefoxTheme ./simplefox.nix;

    simplerentfox = mkFirefoxTheme ./simplerentfox.nix;

    slickfox = mkFirefoxTheme ./slickfox.nix;
}