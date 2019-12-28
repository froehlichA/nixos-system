# ENIGMA HOME CONFIGURATION (User "Alex")

{
    imports = [
		../common/colors/enigma.nix
        ../common/alex.nix
        ../common/conf/vscode/default.nix
        ../common/theme/polybar/simple.nix
        ../common/theme/rofi/space.nix
    ];

    # POLYBAR
    services.polybar.config."module/battery".battery = "BAT1";
    services.polybar.config."module/battery".adapter = "ACAD";
    services.polybar.config."module/wired".interface = "enp4s0f1";
    services.polybar.config."module/wireless".interface = "wlp3s0";
}