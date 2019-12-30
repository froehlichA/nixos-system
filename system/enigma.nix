# ENIGMA

{ stdenv, config, pkgs, ... }:

{
    imports = [
        ./common/conf.nix
    ];

    networking.hostName = "enigma";

	# BOOT
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# DHCP
	networking.interfaces.enp4s0f1.useDHCP = true;
	networking.interfaces.wlp3s0.useDHCP = true;

	# TOUCHPAD
	services.xserver.libinput.enable = true;

    # NVIDIA GPU
    hardware.bumblebee.enable = true;
}