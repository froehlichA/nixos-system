{ pkgs, ... }:
{
    # BOOT
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.configurationLimit = 5;

    # TOUCHPAD
	services.xserver.libinput.enable = true;

	# AMD CPU & GPU
	boot.kernelPackages = pkgs.linuxPackages_latest;                                                                                                                                                                 
	boot.kernelParams = [ "amd_iommu=pt" "ivrs_ioapic[32]=00:14.0" "iommu=soft" ];                                                                                                                                   
	services.xserver.videoDrivers = [ "amdgpu" ];  
	hardware.cpu.amd.updateMicrocode = true;                                                                                                                                                                         
	hardware.enableRedistributableFirmware = true;                                                                                                                                                               
	
	# OPENGL
	hardware.opengl.enable = true;                                                                                                                                                                                   
	hardware.opengl.driSupport = true;

    # GAMING
	hardware.opengl.driSupport32Bit = true;
	hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
}