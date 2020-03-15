# COMMON SYSTEM CONFIGURATION

{ stdenv, config, pkgs, ... }:

let
    repository = "https://github.com/froehlichA/nixos-system";
    autoUpdater = pkgs.writeScriptBin "nixos-update" ''
        #!${pkgs.stdenv.shell}
        rm -rf /tmp/nixos-custom-updater/
        mkdir -p /tmp/nixos-custom-updater/
        cd /tmp/nixos-custom-updater/
        git clone ${repository}
        cd nixos-system
        ./deploy.sh --system --users
    '';
in {
    imports = [
    	# HARDWARE
        # - automatically links with the system-generated one when deploying
    	../../hardware-configuration.nix
  	];

    nixpkgs.config.allowUnfree = true;

    # LANGUAGE & LOCATION
    i18n.defaultLocale = "en_GB.UTF-8";
    services.xserver.layout = "at";
    i18n.consoleUseXkbConfig = true;
    time.timeZone = "Europe/Vienna";

    # NETWORKING
    networking.firewall.enable = false; # Because Minecraft stuff
    networking.useDHCP = false; # DHCP should be enabled per-interface in the system confs
    networking.enableIPv6 = false;
    networking.networkmanager.enable = true;
    programs.nm-applet.enable = true;

    # APPLICATIONS
    environment.systemPackages = with pkgs; [
        # Browser
        firefox-bin
        # System management
        feh
        git
        micro
        neofetch
        unzip
        xclip
        lsof
        # Sound
        lxqt.pavucontrol-qt
        # Auto updater
        autoUpdater
        # VSCODE ( for editing config as mc)
        vscode
    ];
    environment.variables.EDITOR = "micro";
    services.urxvtd.enable = true;
    programs.zsh.enable = true;

    # XSERVER
    services.xserver = {
        enable = true;
        desktopManager.default = "none";
        desktopManager.xterm.enable = false;
        # LightDM
        displayManager.lightdm.enable = true;
        # I3
        windowManager.i3.enable = true;
        windowManager.i3.package = pkgs.i3-gaps;
        # Openbox
        windowManager.openbox.enable = true;
    };

    # USERS
    users.defaultUserShell = pkgs.zsh;
    users.users = let
        superuser = {
            isNormalUser = true;
            shell = pkgs.zsh;
            extraGroups = [ "wheel" "networkmanager" "audio" ];
        };
    in {
        alex = superuser // { description = "Alexander Fröhlich"; };
        mc = superuser // { description = "MC User"; };
    };

    # SSH
    programs.ssh.startAgent = true;
    programs.ssh.knownHosts = {
        github.publicKeyFile = ./files/id_rsa.pub;
    };

    # BASIC FUNCTIONS
    # dbus
    programs.dconf.enable = true;
    services.dbus.packages = [ pkgs.gnome3.dconf ];
    # sound
    hardware.pulseaudio.enable = true;
    sound.enable = true;
    systemd.user.services."pa-applet" = {
        description = "PulseAudio Applet";
        wantedBy = [ "graphical-session.target" ];
        partOf = [ "graphical-session.target" ];
        script = "${pkgs.pa_applet}/bin/pa-applet";
    };
    # backlight
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
    # clipping
    services.clipmenu.enable = true;
    # printing
    services.printing.enable = true;
    # ntfs support
    boot.supportedFilesystems = [ "ntfs" ];

    # NUR
	nixpkgs.config.packageOverrides = pkgs: {
		nur = import (builtins.fetchTarball {
			url="https://github.com/nix-community/NUR/archive/master.tar.gz";
		}) {
			inherit pkgs;
		};
	};

    # GAMING
	hardware.opengl.driSupport32Bit = true;
	hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
	
  	system.stateVersion = "19.09";
}