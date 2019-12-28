# BLOWFISH HOME CONFIGURATION (User "Alex")

{
    imports = [
		../common/colors/blowfish.nix
        ../common/alex.nix
        ../common/conf/vscode/default.nix
        ../common/theme/polybar/simple.nix
        ../common/theme/rofi/space.nix
    ];

    # POLYBAR
    services.polybar.config."module/battery".battery = "BAT0";
    services.polybar.config."module/battery".adapter = "AC";
    services.polybar.config."module/wired".interface = "enp2s0";
    services.polybar.config."module/wireless".interface = "wlp4s0";
}