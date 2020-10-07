{ pkgs, upkgs, ... }:
{
    # HOSTNAME
    networking.hostName = upkgs.autohost.hostname;

    # MANAGEMENT
    networking.networkmanager.enable = true;
    networking.networkmanager.packages = with pkgs; [
        networkmanager-openvpn
    ];
    programs.nm-applet.enable = true;
    environment.systemPackages = with pkgs; [
        networkmanager-openvpn
        networkmanagerapplet
    ];
    

    # Firewall
    networking.firewall.enable = false;

    # DHCP
    networking.useDHCP = false;
    networking.interfaces = upkgs.autohost.withHost {
        skipjack = {
            enp3s0f0.useDHCP = true;
            wlp1s0.useDHCP = true;
        };
        blowfish = {
            enp2s0.useDHCP = true;
            wlp4s0.useDHCP = true;
        };
    };
}