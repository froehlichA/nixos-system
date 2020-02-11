# SKIPJACK HOME CONFIGURATION (User "Alex")

{ pkgs, ... }:
{
    imports = [
		../common/colors/skipjack.nix
        ../common/alex.nix
        ../common/conf/vscode/default.nix
        ../common/theme/polybar/simple.nix
        ../common/theme/rofi/space.nix
    ];

    # POLYBAR
    services.polybar.config."module/battery".battery = "BAT0";
    services.polybar.config."module/battery".adapter = "AC";
    services.polybar.config."module/wired".interface = "enp3s0f0";
    services.polybar.config."module/wireless".interface = "wlp1s0";

    home.packages = with pkgs; [
        # NIXOPS DEPLOYMENT
        nixops
        # RIOT CLIENT FOR MATRIX
        riot-desktop
        # RUST PROGRAMMING
        rustup
    ];
}