{ pkgs, ... }:

{
    config = {
        programs.vscode.extensions = ([ pkgs.vscode-extensions.bbenoist.Nix ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "gitlens";
                publisher = "eamodio";
                version = "10.2.0";
                sha256 = "0qnq9lr4m0j0syaciyv0zbj8rwm45pshpkagpfbf4pqkscsf80nr";
            }
            {
                name = "git-graph";
                publisher = "mhutchie";
                version = "1.19.1";
                sha256 = "04hkyr5v4z62w88lhpqazypnkm48zz474p9cic5ix6k2rd6pj6y5";
            }
            {
                name = "prettier-vscode";
                publisher = "esbenp";
                version = "3.13.0";
                sha256 = "1nbd8jz831q0i3h6kcw5l60gdvrngxjfbjxj8k3gx6fb5d6bvklb";
            }
            {
                name = "file-icons";
                publisher = "file-icons";
                version = "1.0.19";
                sha256 = "0fy02mw563wmnc60kb2k0y2phr6p304c67jjf7hnk6i9gfkfm5am";
            }
            {
                name = "pdf";
                publisher = "tomoki1207";
                version = "0.5.1";
                sha256 = "0bph7gnd6j55r997y62xb7n09cp08i46gmdk0lk5gjbpz3c03hvv";
            }
            {
                name = "path-intellisense";
                publisher = "christian-kohler";
                version = "1.4.2";
                sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4";
            }
        ]);
    };
}