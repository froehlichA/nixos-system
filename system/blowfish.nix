# BLOWFISH

{ stdenv, config, pkgs, ... }:

{
    imports = [
        ./common/conf.nix
    ];

    networking.hostName = "blowfish";

	# BOOT
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# DHCP
	networking.interfaces.enp2s0.useDHCP = true;
	networking.interfaces.wlp4s0.useDHCP = true;

	# TOUCHPAD
	services.xserver.libinput.enable = true;

	# AMD CPU & GPU
	boot.kernelPackages = pkgs.linuxPackages_latest;                                                                                                                                                                 
	boot.kernelParams = [ "amd_iommu=pt" "ivrs_ioapic[32]=00:14.0" "iommu=soft" ];                                                                                                                                   
	services.xserver.videoDrivers = [ "amdgpu" ];  
	hardware.cpu.amd.updateMicrocode = true;                                                                                                                                                                         
	hardware.enableRedistributableFirmware = true;                                                                                                                                                                   
	hardware.opengl.enable = true;                                                                                                                                                                                   
	hardware.opengl.driSupport = true;
}