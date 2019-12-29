# SKIPJACK

{ stdenv, config, pkgs, ... }:

{
    imports = [
        ./common/conf.nix
    ];

    networking.hostName = "skipjack";

	# BOOT
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# DHCP
	networking.interfaces.enp3s0f0.useDHCP = true;
	networking.interfaces.wlp1s0.useDHCP = true;

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

	# SOUND
	boot.extraModprobeConfig = ''
		options snd slots=snd-hda-intel
		options snd_hda_intel enable=0,1
    '';
	boot.blacklistedKernelModules = [ "snd_pcsp" ];

}