{ pkgs, ... }:
{
    require = [
        ../pkgs/battery/.options.nix
    ];

    # DBUS
    programs.dconf.enable = true;
    services.dbus.packages = with pkgs; [ gnome3.dconf ];

    # SOUND
    hardware.pulseaudio.enable = true;
    sound.enable = true;

    # BACKLIGHT
    programs.light.enable = true;
    services.acpid.enable = true;
    services.acpid.handlers = {
        brightness-up = {
            action = "/run/current-system/sw/bin/light -A 30";
            event = "video/brightnessup.*";
        };
        brightness-down = {
            action = "/run/current-system/sw/bin/light -U 30";
            event = "video/brightnessdown.*";
        };
    };

    # FONTS
    fonts.fonts = with pkgs; [
        (nerdfonts.override {
            fonts = [ "FantasqueSansMono" "Meslo" ];
        })
    ];

    # BATTERY NOTIFIER
    services.batteryNotifier.enable = true;

    # CLIPPING
    services.clipmenu.enable = true;

    # PRINTING
    services.printing.enable = true;

    # NTFS
    boot.supportedFilesystems = [ "ntfs" ];

    # NUR
	nixpkgs.config.packageOverrides = pkgs: {
        nur = import <nur> {
            inherit pkgs;
        };
    };

    # UNFREE
    nixpkgs.config.allowUnfree = true;
}